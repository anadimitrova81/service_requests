module Admin
  class UsersController < BaseController
    before_action :set_user, only: %i[update destroy]

    def index
      @users = User.order(:email)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_users_path, notice: "User #{@user.email} was created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "Role updated for #{@user.email}."
      else
        redirect_to admin_users_path, alert: "Failed to update role for #{@user.email}."
      end
    end

    def destroy
      if @user == current_admin
        redirect_to admin_users_path, alert: "You cannot delete yourself."
      else
        @user.destroy
        redirect_to admin_users_path, notice: "User #{@user.email} was deleted."
      end
    end

    private

    def set_user = @user = User.find(params[:id])

    def user_params
      if action_name == "update"
        params.require(:user).permit(:role)
      else
        params.require(:user).permit(:email, :password, :password_confirmation, :role)
      end
    end
  end
end
