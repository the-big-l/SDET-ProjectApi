class ProjectsController < ApplicationController
  def create
    @project = Project.new(api_params)
    @errors = []
    additional_project_param_parsing
    add_target_countries

    render_response
  end

  private

  def render_response
    if @project.save && @errors.empty?
      render json: @project
    else
      @errors.concat(@project.errors.full_messages)
      render json: @errors, status: 422
    end
  end

  def additional_project_param_parsing
    @project.id = params[:id]
    @project.creation_date = reverse_date(params[:creationDate])
    @project.expiry_date = reverse_date(params[:expiryDate])
  end

  def add_target_countries
    create_countries
    duplicate_countries?
    countries = Country.where(name: params[:targetCountries])
    @project.countries << countries
  end

  def duplicate_countries?
    target_countries = params[:targetCountries]
    unless target_countries.uniq.count == target_countries.count
      @errors << "Project contains duplicate countries"
    end
  end

  def create_countries
    # ActiveRecord (ORM) isn't smart enough to insert mulitple records
    # in one commit so iterating here is fine. A custom SQL insert would
    # be more efficient and can be added later.
    params[:targetCountries].each do |country|
      Country.create(name: country)
    end
  end

  def reverse_date(date_time)
    date, time = date_time.split(' ')
    date = date[-4..-1] + date[0..3]
    [date, time].join(' ')
  end

  def api_params
    params[:snakecase].present? ? api_params : snakecase_params
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
