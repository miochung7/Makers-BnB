
def flash_types
  [:success, :notice, :warning, :error]
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'makersbnb')
  result = connection.query("SELECT * FROM users WHERE user_id = #{id};")
  #result.first
end

def user_exists?(email_address)
  return true if User.all.include?(email_address)
end
