class Client < ActiveRecord::Base
  attr_accessible :company_name, :status,:user
  has_one :user, :as => :userable

  has_many :leads  ,:dependent => :destroy
  has_many :projects ,:dependent => :destroy

  has_many :notes , :as => :noteable

  accepts_nested_attributes_for :user,:allow_destroy => true

end
