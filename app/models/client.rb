class Client < ActiveRecord::Base
  attr_accessible :company_name, :status,:user
  has_one :user, :as => :userable
  has_many :leads
  accepts_nested_attributes_for :user,:allow_destroy => true

end
