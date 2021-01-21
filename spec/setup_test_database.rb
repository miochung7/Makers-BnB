require 'pg'


def setup_test_database
  p 'setting up test database'
  connection = PG.connect(dbname: 'makersbnb_test')

  connection.exec("TRUNCATE spaces, users;")

end



#requires reworking to be able to truncate both tables without issue
