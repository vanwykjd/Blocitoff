require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
    
    
    let(:factory_user) { create(:user) }
    let(:todo_item) { create(:item, user: factory_user) }
    
    
        
    describe "POST create" do
        before do
            sign_in(factory_user)
        end
        
        render_views
        
        it "creates an Item and redirects to the User's page" do
            post :create, user: factory_user, user_id: factory_user.id, item: {task: "Todo Item", rank: 2, completed: false }
            expect(response).to have_http_status(302)
            redirect_to("/users/#{@user}")
        end
        
        it "increases the number of items by 1" do
            expect{ post :create, user: factory_user, user_id: factory_user.id, item: {task: "Todo Item", rank: 2, completed: false }  }.to change(Item,:count).by(1)
        end

        it "assigns the new item to @item" do
            post :create, user: factory_user, user_id: factory_user.id, item: {task: "Todo Item", rank: 2, completed: false }
            expect(assigns(:item)).to eq Item.last
        end

        
    end


end
