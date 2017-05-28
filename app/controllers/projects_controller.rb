class ProjectsController < ApplicationController
  def create
    @project = Project.new(api_params)
    @errors = []
    additional_project_param_parsing

    render_response
  end

  def show
    @project = Project.includes(
      :countries,
      :keys
    ).find(params[:id])
  end

  private

  def additional_project_param_parsing
    @project.id = params[:id]
    @project.creation_date = reverse_date(params[:creationDate])
    @project.expiry_date = reverse_date(params[:expiryDate])
    add_target_countries
    add_target_keys
  end

  def render_response
    if @project.save && @errors.empty?
      render :show
    else
      @errors.concat(@project.errors.full_messages)
      render json: @errors, status: 422
    end
  end

  def add_target_countries
    create_countries
    duplicate?(:targetCountries)
    countries = Country.where(name: params[:targetCountries])
    @project.countries << countries
  end

  def add_target_keys
    create_keys
    duplicate?(:targetKeys)
    keys = params[:targetKeys].map do |key|
      Key.find_by(number: key[:number], keyword: key[:keyword])
    end
    @project.keys << keys
  end

  def create_countries
    # ActiveRecord (ORM) isn't smart enough to insert mulitple records
    # in one commit so iterating here is fine. A custom SQL insert would
    # be more efficient and can be added later.
    params[:targetCountries].each do |country|
      Country.create(name: country)
    end
  end

  def create_keys
    params[:targetKeys].each do |key|
      Key.create(number: key[:number], keyword: key[:keyword])
    end
  end

  def duplicate?(key)
    targets = params[key]
    unless targets.uniq.count == targets.count
      @errors << "Project contains duplicate #{key.to_s}"
    end
  end

  def reverse_date(date_time)
    date, time = date_time.split(' ')
    date = date[-4..-1] + date[0..3]
    [date, time].join(' ')
  end

  def api_params
    params[:snakecase].present? ? project_params : snakecase_params
  end

  def project_params
    params.permit(:projectName, :enabled, :projectCost, :projectUrl)
  end

  # Front End (javascript) convention is to store keys/variables in
  # CamelCase where as Rails (Ruby) convention is to use snake_case. I
  # chose to make this conversion on the back end as the incoming data
  # format was already laid out in the requirements. Using the below
  # method accommodates both conventions.
  #
  # Source for snakecase_params:
  # http://crypt.codemancers.com/posts/2016-03-25-api-transformations-in-rails/
  #
  def snakecase_params
    snakecase_keys(project_params)
  end

  def snakecase_keys(hash)
    deep_transform_keys(hash) { |k| k.to_s.underscore.to_sym }
  end

  def deep_transform_keys(hash, &block)
    result = {}
    hash.each do |k, v|
      result[yield(k)] = v.is_a?(Hash) ? deep_transform_keys(v, &block) : v
    end
    result
  end
end
