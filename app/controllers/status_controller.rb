class StatusController < ApplicationController
  def show
    return unless params[:query]

    @query = params[:query].strip
    if @query.blank?
      @error = "Please enter a phone number, email, or request ID."
    else
      @requests = Request.where("phone = :q OR customer_id = :q OR email = :q", q: @query).order(created_at: :desc)
    end
  end
end
