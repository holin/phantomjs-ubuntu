require "selenium-webdriver"
driver = Selenium::WebDriver.for(:remote, :url => "http://localhost:8910")

# set window size using Dimension struct
target_size = Selenium::WebDriver::Dimension.new(1400, 1000)
driver.manage.window.size = target_size

driver.navigate.to "http://192.168.21.126:3000/composing?id=264"
sleep 10
driver.save_screenshot('/tmp/screenshots/264.png')