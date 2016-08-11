class ItemsController < ApplicationController

    
    def create
    	@user = User.find(params[:user_id])
    	@item = @user.items.new(item_params)
    
 
    	if @item.save
    		flash[:notice] = "Item added successfully."
    		redirect_to [@user] and return
    	else
    		flash[:alert] = "Item failed to be added."
    	end
    end

    
private
 
  def item_params
     params.require(:item).permit(:rank, :task, :completed)
  end
end
