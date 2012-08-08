class Pick < ActiveRecord::Base
  attr_accessible :earnings, :golfer_id, :tournament_id, :user_id
  
  belongs_to :user
  belongs_to :golfer
  belongs_to :tournament
  
  after_create :first
  
  def first
    self.earnings = 0
    self.save
  end
  
  
end
