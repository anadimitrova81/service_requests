module Admin
  class RequestsController < BaseController
    before_action :set_request, only: %i[show edit update]

    def index
      @requests = scoped_requests.order(created_at: :desc)
    end

    def show
    end

    def new
      @request = Request.new
    end

    def create
      @request = Request.new(request_params)

      if @request.save
        redirect_to admin_request_path(@request), notice: "Request created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @request.update(request_params)
        redirect_to admin_requests_path, notice: "Request #{@request.customer_id} updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_request = @request = scoped_requests.find(params[:id])
    def scoped_requests = Request.where(status: Request.statuses_for(current_admin.role))

    def request_params
      params.require(:request).permit(
        :name, :email, :phone, :city,
        :address_line_1, :address_line_2, :pick_up_at, :status
      )
    end
  end
end
