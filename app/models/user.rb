class User < ActiveRecord::Base
  attr_accessible :login, :password, :remember_me
  devise :ldap_authenticatable, :rememberable, :trackable


  before_save :get_ldap_email

  def get_ldap_email
    self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail")
  end

end
