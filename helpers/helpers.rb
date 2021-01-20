
def flash_types
  [:success, :notice, :warning, :error]
end


def user_exists?(email_address)
  return true if User.all.include?(email_address)
end
