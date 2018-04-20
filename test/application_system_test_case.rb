require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1920, 1080]
  Selenium::WebDriver::Chrome.driver_path="/home/josh/.rvm/webdrivers/chromedriver"
end
