class Alert < ActiveRecord::Base
  after_find :format_date
  
  default_scope order('created_at desc')

  belongs_to :course 
  belongs_to :user
  has_many :audits, :as => :audit
  
  validates_presence_of :title, :expire, :description
  validates_presence_of :course_id
 
  validate :expire_today
  
  def opened_alert?(user_audit)
    if User.find(user_audit).student?
      self.audits.where(:user_id => user_audit).present?
    else
      true
    end
  end
 
private

  def expire_today
    errors.add(:expire, I18n.t(:cannot_alert_date_expire)) if expire.present? && (expire<Date.today)
  end
  
  def format_date
     self.expire = I18n.l (expire)
  end
end
