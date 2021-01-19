require 'pg'

class User

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'makersbnb_test'
    else
      connection = PG.connect :dbname => 'makersbnb'
    end
    result = connection.exec('SELECT * FROM users')
    result.map { |user| user['email_address']}
  end
  def self.sign_up(email_address, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'makersbnb_test'
    else
      connection = PG.connect :dbname => 'makersbnb'
    end
    connection.exec("INSERT INTO users (email_address, password) VALUES('#{email_address}', '#{password}')")
  end
end
