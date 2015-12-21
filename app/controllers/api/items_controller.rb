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
      @items = @list.iteams.all.where(if_complete: false)
      render :json => { errors: "Record not found. Command failed."}, :status => :not_found
    end

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end

  end

  private
  def item_params
    params.require(:item).permit(:name)
  end

end
