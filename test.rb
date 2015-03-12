require 'selenium-webdriver'
require_relative 'sys/WebPage'
require_relative 'sys/LoginPage'

def test1 user_email, user_pass
  puts '---- start --- test1'
  login_page = LoginPage.open
  login_page.fill_user_email_field(user_email).fill_user_password_field(user_pass).click_login_button

  if login_page.logged_in?
    puts '-- Test passed'
  else
    puts "-- Test failed. Error message: #{login_page.flash_alert_text}"
  end
  login_page.logout

  puts '---- end ---'
end

def test2 user_email, user_pass
  puts '---- start ---- test2'
  login_page = LoginPage.open
  login_page.fill_user_email_field(user_email).fill_user_password_field(user_pass).click_login_button

  if !login_page.logged_in?
    puts '-- Test passed'
  else
    puts "-- Test failed. Error message: #{login_page.flash_alert_text}"
  end
  login_page.logout

  puts '---- end ----'
end

def test3 user_email, user_pass
  puts '---- start ---- test3'
  login_page = LoginPage.open
  login_page.fill_user_email_field(user_email).fill_user_password_field(user_pass).click_login_button.logout

  if !login_page.logged_in?
    puts '-- Test passed'
  else
    puts "-- Test failed. Error message: #{login_page.flash_alert_text}"
  end
  login_page.logout

  puts '---- end ----'
end

test1 'f53688@trbvm.com','12345678'
test2 'nocorrect@email.com','12345678'
test3 ' ',' '