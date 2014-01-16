class User < ActiveRecord::Base
  attr_accessible :login, :password, :remember_me
  devise :ldap_authenticatable, :rememberable, :trackable
end
