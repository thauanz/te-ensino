class Audit < ActiveRecord::Base
  belongs_to :user
  belongs_to :audit, :polymorphic => true
  
  validates_uniqueness_of :user_id, :scope => [:audit_id, :audit_type]
end
