class Project < ActiveRecord::Base
  attr_accessible :title,:start_date,:status,:lead_id,:client_id,:pm_id
  belongs_to :lead
  belongs_to :client
  belongs_to :resource

  has_many :notes , :as => :noteable
end
