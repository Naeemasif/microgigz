class Project < ActiveRecord::Base
  attr_accessible :client_id, :lead_id, :pm_name, :resource_id, :start_date, :status, :title
  belongs_to :lead
  belongs_to :client
  belongs_to :resource
end
