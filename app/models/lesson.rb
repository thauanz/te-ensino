class Lesson < ActiveRecord::Base

  default_scope order("course_id, date_at")
  
  after_find :format_date
  
  belongs_to :user 
  belongs_to :course
  has_and_belongs_to_many :assets
  has_many :audits, :as => :audit
  
  validates_presence_of :course_id, :theme, :date_at, :description
  #validates_uniqueness_of :date_at
  
  def opened_lesson?(user_audit)
    if User.find(user_audit).student?
      self.audits.where(:user_id => user_audit).present?
    else
      true
    end
  end
  
private  
  def format_date
     self.date_at = I18n.l (date_at)
  end
end
