Given(/^I am on the home page$/) do
  visit '/'
  page.should have_content 'You need to sign in or sign up before continuing.'
end

Given(/^There is a user account$/) do
  visit '/'
  within('nav') { click_on('Sign up') }
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  within('form') { click_on('Sign up') }
  within('nav') { click_on('Logout') }
end

Given(/^I am logged in with a user account$/) do
  visit '/'
  within('nav') { click_on('Sign up') }
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  within('form') { click_on('Sign up') }
  visit '/'
end

When(/^I log out$/) do
  click_on('Logout')
end

Then(/^I am logged out$/) do
  page.should have_content('You need to sign in or sign up before continuing.')
end

When(/^I log in with my accoutn information$/) do
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'password'
  within('form') { click_on('Log in') }
end

Then(/^I am logged in$/) do
  page.should have_content 'Signed in successfully.'
end

When(/^I sign up with account information$/) do
  within('nav') { click_on('Sign up') }
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  within('form') { click_on('Sign up') }
end

Then(/^I am signed up$/) do
  page.should have_content 'You have signed up successfully.'
end
