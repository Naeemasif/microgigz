class Lead < ActiveRecord::Base

  attr_accessible :client_id, :description, :title, :status


  searchable do
    text :title, :boost => 5
    text :description
    time :updated_at
    time :created_at
  end

  belongs_to :client
  has_one :quote  ,:dependent => :destroy
  has_one :project , :dependent => :destroy


end
