class ItemsController < ApplicationController

  def create
    @item = current_user.items.build(item_params)


    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to current_user
    else
      flash.now[:alert] = @item.errors.full_messages.to_sentence #"There was an error saving the item. Please try again."
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Task was complete! Delete successful."
      redirect_to current_user
    else
      flash.now[:alert] = "There was a problem marking your task as complete"
      redirect_to current_user
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
