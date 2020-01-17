# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save!
    render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                   username: @user.username }, status: :ok
  end
end
