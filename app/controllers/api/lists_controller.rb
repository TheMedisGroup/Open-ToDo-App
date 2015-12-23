class Api::ListsController < ApiController
  before_action :authenticated?

  def index
    @user = User.find(params[:user_id])
    @list = @user.lists.all
    render json: @list, each_serializer: ListSerializer
  end

  def create
    @list = List.new(list_params)
    if @list.save
      render json: @list.to_json
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def destroy
    begin
      list = List.find(params[:id])
      list.destroy

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  def update
    begin
      list = List.find(params[:id])
      if list.update(list_params)
        render json: list.to_json
      else
        render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "List not found. Command failed."}, :status => :not_found
    end
  end
  
  private

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
