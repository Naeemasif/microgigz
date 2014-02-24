class Client < ActiveRecord::Base
  attr_accessible :company_name, :status
  has_one :user, :as => :userable
  has_many :leads  ,:dependent => :destroy
  has_many :projects ,:dependent => :destroy

  has_many :notes , :as => :noteable

end
