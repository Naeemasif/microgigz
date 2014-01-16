class Client < ActiveRecord::Base
  attr_accessible :company_name, :status
  has_one :profile, :as => :profileable
  has_many :leads
  has_many :projects
end
