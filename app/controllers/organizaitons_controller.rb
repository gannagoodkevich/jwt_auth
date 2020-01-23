class OrganizaitonsController < ApplicationController
  before_action :authenticate_user!

  def show
    @organization = Organization.find_by(id: params[:id])
    not_existed_error if @organization.nil?
  end
end
