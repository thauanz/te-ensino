class Asset < ActiveRecord::Base
  
  default_scope order('created_at desc')
  
  belongs_to :user
  has_and_belongs_to_many :lesson
  
  validates_presence_of :title, :user_id
 
  has_attached_file :document, :url => "/assets/:id/:basename.:extension",  
                    :path => ":rails_root/public/assets/:id/:basename.:extension"
  
  validates_attachment_presence :document, :message => "nao foi selecionado"
  validates_attachment_size :document, :less_than => 5.megabyte, :message => "deve ter tamanho entre: 0 e 5Mb"
end
