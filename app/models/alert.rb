class Alert < ActiveRecord::Base
  after_find :format_date
  
  default_scope order('created_at desc')

  belongs_to :course 
  belongs_to :user
  
  validates_presence_of :title, :expire, :description
  validates_presence_of :course_id
 
#  with_options :allow_blank => true do |v|
#    v.validates_format_of :expire, :with => /^([0-9]{2}\/[0-9]{2}\/[0-9]{4})$/, :message => "formato invalido"
#  end

  validate :expire_today
 
private

  def expire_today
    errors.add(:expire, I18n.t(:cannot_alert_date_expire)) if expire.present? && (expire<Date.today)
  end
  
  def format_date
     self.expire = I18n.l (expire)
  end
end
