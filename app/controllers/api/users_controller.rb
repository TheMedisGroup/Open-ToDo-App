class Api::UsersController < ApiController

  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.to_json
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      user = User.find(params[:id])
      if user.destroy
        render json: { message: "HTTP 204 No Content. User deleted Successfully"}, status: :no_content
      end
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "User not found. Command failed."}, :status => :not_found
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :email)
    end

  end
