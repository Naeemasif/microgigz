class Resource < ActiveRecord::Base
  attr_accessible :project_id,:availability
  has_one :user, :as => :userable

  has_many :notes , :as => :noteable

end
