class Quote < ActiveRecord::Base
  attr_accessible :description, :lead_id
  belongs_to :lead
end
