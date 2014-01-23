
require 'net/ldap'
module LDAP

  def self.authenticate(login, pass)

      conn = Net::LDAP.new(:host => "10.28.82.2", :port =>389, :base =>"dc=nextbridge,dc=org", :auth => {:username => "#{login}@nextbridge.org", :password => pass, :method => :simple})

            if conn.bind
              conn.search(:base =>"dc=nextbridge,dc=org", :filter => Net::LDAP::Filter.eq("userPrincipalName","#{login}@nextbridge.org")).first

            else
              return false
            end
    end
end