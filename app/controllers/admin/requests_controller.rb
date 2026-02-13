module Admin
  class RequestsController < BaseController
    def index
      @requests = Request.order(created_at: :desc)
    end

    def show
      @request = Request.find(params[:id])
    end
  end
end
