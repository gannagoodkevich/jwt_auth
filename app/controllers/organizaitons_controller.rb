class OrganizaitonsController < ApplicationController
  before_action :authenticate_user!

  def show
    @organization = Organization.find_by(id: params[:id])
  end
end
