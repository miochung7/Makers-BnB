
def flash_types
  [:success, :notice, :warning, :error]
end


def user_exists?(email_address)
  return true if User.all.include?(email_address)
end

def correct_password?(email_address, entered_password)
  user_password = DatabaseConnection.query("SELECT password FROM users WHERE email_address = '#{email_address}'")
  result = user_password.map { |user| user['password']}
  return true if result.include?(entered_password)
end
