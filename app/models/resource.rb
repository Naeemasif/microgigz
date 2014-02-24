class Resource < ActiveRecord::Base
  attr_accessible :project_id, :availability, :user
  has_one :user, :as => :userable
  has_many :projects
  has_many :skills
  accepts_nested_attributes_for :user,:allow_destroy => true
end
