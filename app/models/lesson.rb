class Lesson < ActiveRecord::Base

  default_scope order("date_at")
  
  after_find :format_date
  
  belongs_to :user 
  belongs_to :course
  has_and_belongs_to_many :assets
  
  validates_presence_of :theme, :date_at, :description
  #validates_uniqueness_of :date_at
  
private  
  def format_date
     self.date_at = I18n.l (date_at)
  end
end
