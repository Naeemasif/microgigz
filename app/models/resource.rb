class Resource < ActiveRecord::Base
  attr_accessible :project_id
  has_one :profile, :as => :profileable
  has_many :projects
end
