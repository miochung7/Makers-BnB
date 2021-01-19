require_relative 'database_connection'

if ENV['ENVIRONMENT'] == 'test'
  p 'I am in test env'
  DatabaseConnection.setup('makersbnb_test')
else
  p "I'm not in test ENV"
  DatabaseConnection.setup('makersbnb')
end

