require 'pg'
require_relative 'database_connection'
require_relative 'database_connection_setup'

class User

  def self.all
    result = DatabaseConnection.query('SELECT * FROM users')
    result.map { |user| user['email_address']}
  end
  def self.sign_up(email_address, password)
    DatabaseConnection.query("INSERT INTO users (email_address, password) VALUES('#{email_address}', '#{password}')")
  end
end
