class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :telephone, :login_id
  # attr_accessible :title, :body

  belongs_to :userable, :polymorphic => true

  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles
end
