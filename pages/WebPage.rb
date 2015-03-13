require 'selenium-webdriver'

class WebPage
  DRIVER = Selenium::WebDriver.for(:chrome)

  def self.open
    DRIVER.navigate.to self::URL
    new
  end

  def driver
    DRIVER
  end

  def flash_notice_text
    puts 'Get flash notice text'
    DRIVER.find_element(:id, 'flash_notice').text
  end

  def flash_alert_text
    puts 'Get flash notice text'
    DRIVER.find_element(:id, 'flash_alert').text
  end

  def logged_in?
    DRIVER.find_elements(:xpath, "//a[.='Logout']").count > 0
  end

  def logout
    if logged_in?
      DRIVER.find_element(:xpath, "//a[.='Logout']").click
    end
  end
end