class Item < ActiveRecord::Base
    
    belongs_to :user
  
    validates :rank, presence: true
    validates :task, presence: true, length: { minimum: 1 }
    validates :completed, inclusion: [true, false]
    validates :user, presence: true 
    
       
end
