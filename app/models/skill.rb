class Skill < ActiveRecord::Base
  attr_accessible :rating, :resource_id, :technology

  belongs_to :resource
end
