class Chat < ActiveRecord::Base
  default_scope order('created_at')
 
  validates_presence_of :content
  belongs_to :course
  belongs_to :user
end
