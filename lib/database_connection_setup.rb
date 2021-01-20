
require_relative 'database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  connection = DatabaseConnection.setup('makersbnb_test')
else
  connection = DatabaseConnection.setup('makersbnb')
end
