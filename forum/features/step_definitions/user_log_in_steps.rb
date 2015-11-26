Given(/^I am on the home page$/) do
  visit "/"
end

Given(/^I am logged in$/) do
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
   
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text    
end

Then(/^I should see "(.*?)" in a link$/) do |text|
  page.has_link? text
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |element, text|
  fill_in element, with: text
end

When(/^I click "(.*?)"$/) do |element|
  save_and_open_page
  click_on element
end


