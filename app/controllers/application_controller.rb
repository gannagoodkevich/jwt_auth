class ApplicationController < ActionController::API
  def not_existed_error
    render(file: "#{Rails.root}/public/404.html", layout: false)
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status_code: 422,
          title: 'Bad Request',
          detail: resource.errors
        }
      ]
    }, status: :bad_request
  end
end