require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
    
    let(:factory_user) { create(:user) }
    let(:todo_item) { create(:item, user: factory_user) }
    
    
        
    describe "POST create" do
       
        
        it "increases the number of items by 1" do
            sign_in(:factory_user)
            expect{ post :create, user: factory_user, user_id: factory_user.id, item: {task: "Todo Item", rank: 2, completed: false }  }.to change(Item,:count).by(1)
        end

        it "assigns the new item to @item" do
            post :create, user: factory_user, user_id: factory_user.id, item: {task: "Todo Item", rank: 2, completed: false }
            expect(assigns(:item)).to eq Item.last
        end

        it "returns http success" do
            post :create, user: factory_user, user_id: factory_user.id, item: {task: "Todo Item", rank: 2, completed: false }
            expect(response).to have_http_status(:success)
        end
    end


end
