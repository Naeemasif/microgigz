class Resource < ActiveRecord::Base
  attr_accessible :project_id,:availability
  has_one :profile, :as => :profileable
  has_many :projects
end
