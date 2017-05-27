class ProjectsController < ApplicationController
  def create
    @project = Project.new(api_params)
    @project.project_id = params[:id]
    @project.creation_date = reverse_date(params[:creationDate])
    @project.expiry_date = reverse_date(params[:expiryDate])

    if @project.save
      render json: @project
    else
      render json: @project.errors.full_messages, status: 422
    end
  end

  private

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
