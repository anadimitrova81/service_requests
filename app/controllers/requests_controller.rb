class RequestsController < ApplicationController
  before_action :redirect_logged_in_users

  def new
    @request = Request.new
  end

  def show
    @request = Request.find(params[:id])
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to @request
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def redirect_logged_in_users
    redirect_to admin_requests_path if admin_logged_in?
  end

  def request_params
    params.require(:request).permit(
      :name,
      :email,
      :phone,
      :city,
      :address_line_1,
      :address_line_2,
      :pick_up_at
    )
  end
end
