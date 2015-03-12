
class LoginPage < WebPage
  URL = "http://howitzer.strongqa.com/users/sign_in"

  def login
    driver.find_element(:link_text,'Login').click
    self
  end

  def fill_user_email_field(user_email)
    puts "-- fill user email field '#{user_email}'"
    driver.find_element(:id, 'user_email').send_keys(user_email)
    self
  end

  def fill_user_password_field(user_pass)
    puts "-- Fill user password field #{user_pass}"
    driver.find_element(:id, 'user_password').send_keys(user_pass)
    self
  end

  def click_login_button
    puts '-- Click Login button'
    driver.find_element(:name, 'commit').submit
    self
  end

end
