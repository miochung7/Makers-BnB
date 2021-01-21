require 'pg'
require 'bcrypt'
require_relative 'database_connection'
require_relative 'database_connection_setup'
require './helpers/helpers'

class User
=begin
  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
=end
  def self.all
    result = DatabaseConnection.query('SELECT * FROM users')
    result.map { |user| user['email_address']}
  end

  def self.sign_up(email_address, password)
    DatabaseConnection.query("INSERT INTO users (email_address, password) VALUES('#{email_address}', '#{password}')")
  end

  def self.find(id)
    return id unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE user_id = '#{id}'")
    end
  end

  def self.log_in(email_address:, password:)
    if user_exists?(:email_address)
      entered_password = DatabaseConnection.query("SELECT password FROM users WHERE email_address = '#{email_address}'")
      result = DatabaseConnection.query("SELECT * FROM users WHERE email_address = '#{params[:email]}'")
    return user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])
    end
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email_address = '#{email}'")

      return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['id'], result[0]['email'])
  end
