class StatusController < ApplicationController
  def show
    if params[:query].present?
      @query = params[:query].strip
      @requests = Request.where("phone = :q OR customer_id = :q", q: @query).order(created_at: :desc)
    end
  end
end
