class Api::ItemsController < ApiController
	before_action :authenticated?

  def index
    begin
      if params[:list_id]
        @list = List.find(params[:list_id])
      else
        @item = Item.find(params[:id])
        @list = List.find(@item.list_id)
      end
      @items = @list.items.all.where(if_complete: false)
      render :json => { errors: "Record not found. Command failed."}, :status => :not_found
    end
  end

  def create
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list = @list

    if @item.save
      render json: @item.to_json
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @item = Item.find(params[:id])
      @item.destroy
      render json: { message: "HTTP 204 No Content. Item Deleted Successfully."}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "Item not found. Command failed."}, :status => :not_found
    end
  end

  def update
    begin
      @item = Item.find(params[:id])
      if @item.update(item_params)
        render json: @item.to_json
      else
        render json: { errors: @item.error.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "Item not found. Command failed."}
    end
  end

  private
  def item_params
    params.require(:item).permit(:description, :completed)
  end

end
