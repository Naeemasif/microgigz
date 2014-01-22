class Lead < ActiveRecord::Base
  attr_accessible :client_id, :description, :title, :status
  belongs_to :client
  has_one :quote
  has_one :project
end
