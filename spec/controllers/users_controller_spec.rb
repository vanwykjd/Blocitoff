require 'rails_helper'

RSpec.describe UsersController, type: :controller do
   
 
describe "user sign in" do
     
     it "renders the #show view" do
       sign_in(:factory_user)
       get :show, {id: factory_user.id}
       expect(response).to render_template :show
     end
     
     it "assigns factory_user to @user" do
       get :show, {id: factory_user.id}
       expect(assigns(:user)).to eq(factory_user)
     end
   end

end