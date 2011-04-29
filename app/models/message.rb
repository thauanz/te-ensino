class Message < ActiveRecord::Base
  has_ancestry
  
  belongs_to :forum
  belongs_to :user
end
