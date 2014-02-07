class Client < ActiveRecord::Base
  attr_accessible :company_name, :status
  has_one :user, :as => :userable


end
