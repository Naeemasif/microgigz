class Note < ActiveRecord::Base
  attr_accessible :description, :noteable_id, :noteable_type
   belongs_to :noteable, :polymorphic => true
end
