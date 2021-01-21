require 'pg'
require_relative 'database_connection'
require_relative 'database_connection_setup'
require './helpers/helpers'

class User
  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM users')
    result.map { |user| user['email_address']}
  end

  def self.sign_up(email_address, password)
    DatabaseConnection.query("INSERT INTO users (email_address, password) VALUES('#{email_address}', '#{password}')")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE user_id = '#{id}'")
    user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def self.log_in(email_address, password)
    if user_exists?(email_address)
      #entered_password = DatabaseConnection.query("SELECT password FROM users WHERE email_address = '#{email_address}'")
      #result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params[:email]}'")
      #return user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])
    end
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email_address = '#{email}'")
    return unless result.any?

    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end
end
      # if entered_password == password
      #   logged_in? = true
      # else
        #return "Your details are incorrect"

      #return "Your details are incorrect"


#end
