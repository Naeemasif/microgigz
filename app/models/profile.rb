class Profile < ActiveRecord::Base
  attr_accessible :email, :name, :profileable_id, :profileable_type, :telephone
  belongs_to :profileable, :polymorphic => true
end
