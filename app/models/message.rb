class Message < ActiveRecord::Base
  has_ancestry
  validates_presence_of :content
  belongs_to :forum
  belongs_to :user
end
