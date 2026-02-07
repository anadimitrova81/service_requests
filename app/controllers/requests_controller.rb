class RequestsController < ApplicationController
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

  def request_params
    params.require(:request).permit(
      :name,
      :email,
      :phone,
      :city,
      :address_line_1,
      :address_line_2,
      :pick_up_at,
      :delivery_at
    )
  end
end
