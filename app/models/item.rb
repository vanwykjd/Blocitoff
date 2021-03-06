class Item < ActiveRecord::Base
    
    belongs_to :user
  
    #validates :rank, presence: true
    validates :task, presence: true, length: { minimum: 1 }
    #validates :completed, inclusion: [true, false]
    validates :user, presence: true
    
    default_scope { order('updated_at DESC') }
    
    private 
    
    def self.default_scope
        Item.where("updated_at >= ?", Time.now - 7.days)
    end

end
