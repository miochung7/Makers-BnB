require 'pg'
require_relative 'database_connection'
require_relative 'database_connection_setup'
require './helpers/helpers'

class User

  def self.all
    result = DatabaseConnection.query('SELECT * FROM users')
    result.map { |user| user['email_address']}
  end
  
  def self.sign_up(email_address, password)
    DatabaseConnection.query("INSERT INTO users (email_address, password) VALUES('#{email_address}', '#{password}')")
    
  end

  def self.log_in(email_address, password)
    if user_exists?(email_address)
      entered_password = DatabaseConnection.query("SELECT password FROM users WHERE email_address = '#{email_address}'")
      if entered_password == password
        #login
      else
        return "Your details are incorrect"
      end
    else 
      return "Your details are incorrect"
    end
  end
  
end
