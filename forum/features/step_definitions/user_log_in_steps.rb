Given(/^I am on the home page$/) do
  visit "/"
end

When(/^I sign up with account information$/) do
  within("nav") { click_on('Sign up') }
  fill_in "Email", with: "user@example.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  within("form") { click_on('Sign up') }
end


Then(/^I am signed up$/) do
  page.should have_content "You have signed up successfully."
end
