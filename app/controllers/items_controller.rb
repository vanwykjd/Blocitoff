class ItemsController < ApplicationController

    
    def create
    	@user = User.find(params[:user_id])
    	@item = @user.items.new(item_params)
    	@item.user = current_user
    	@new_item = Item.new
    
 
    	if @item.save
    		flash.now[:notice] = "Item added successfully."
    	else
    		flash.now[:alert] = "Item failed to be added."
    	end
    	
    	respond_to do |format|
            format.html
            format.js
        end
    end
    
    def destroy
    	@user = User.find(params[:user_id])
    	@item = @user.items.find(params[:id])
 
    	if @item.destroy
    	    if (@user.items.count) > 0
    		  flash[:notice] = "One down...only #{@user.items.count} more to go!"
    		else
    		  flash[:notice] = "Boom..finished"
    	    end 
    	else
    		flash[:alert] = "Task couldn't be deleted. Try again."
    	end
    	
    	respond_to do |format|
    		format.html
    		 format.js 
    	end
    end

    
private
 
  def item_params
     params.require(:item).permit( :task )  ## Add => :rank, :completed later
  end
  
  def distance_of_time_in_words
      from_time = @item.created_at
      to_time = 7.days
      from_time + to_time
  end
      
end
