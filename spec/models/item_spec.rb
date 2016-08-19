require 'rails_helper'

RSpec.describe Item, type: :model do
  
  let(:factory_user) { create(:user) }
  let(:todo_item) { create(:item, user: factory_user) }

  it { is_expected.to belong_to(:user) }
  
# it { is_expected.to validate_presence_of(:rank) }
  it { is_expected.to validate_presence_of(:task) }
  
  it { is_expected.to validate_length_of(:task).is_at_least(1) }
  
  describe "attributes" do
     it "has a rank, task, and user attributes" do
       expect(todo_item).to have_attributes( task: todo_item.task, user: todo_item.user ) ## => Add "rank: todo_item.rank" later
   	 end
  end
  
# it "is NOT completed by default" do
#     expect(todo_item.completed).to be(false)
# end

end