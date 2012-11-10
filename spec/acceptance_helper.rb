require 'spec_helper'

def human_check(message)
  #sleep 2
  page.execute_script("$('#messagebox').html('#{message}');");
  page.should have_content('Txatxi')
end

def resize(size)
  if size == :mobile
    Capybara.current_session.driver.browser.manage.window.resize_to(320,600)
  elsif size == :bigmobile
    Capybara.current_session.driver.browser.manage.window.resize_to(650,600)
  elsif size == :smalltablet
    Capybara.current_session.driver.browser.manage.window.resize_to(790,600)
  elsif size == :netbook
    Capybara.current_session.driver.browser.manage.window.resize_to(1024,700)
  elsif size == :desktop
    Capybara.current_session.driver.browser.manage.window.resize_to(1280,900)
  end
end

def human_check_sizes(message)
  resize :desktop
  human_check message
  resize :netbook
  human_check message
  resize :smalltablet
  human_check message
  resize :bigmobile
  human_check message
  resize :mobile
  human_check message
end

def login
  visit '/login'
  fill_in 'login', :with => 'test@test.com'
  fill_in 'password', :with => 'SuperPass'
  click_button 'Login'
end
