class Forum < ActiveRecord::Base

  belongs_to :user
  has_many :messages, :dependent => :destroy
  accepts_nested_attributes_for :messages, :allow_destroy => true
  
  validates_presence_of :title
  
end
