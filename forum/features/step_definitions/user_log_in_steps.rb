Given(/^I am on the home page$/) do
  visit '/'
end

Given(/^There is a user account$/) do
  @user = User.new(email: "user@example.com", password: "password")
  @user.save
end

Given(/^I am logged in with a user account$/) do
  @user = User.new(email: "user@example.com", password: "password")
  @user.save
  visit '/'
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'password'
  within('form') { click_on('Log in') }
end

When(/^I view the post$/) do
  click_on('Show')
end

Then(/^I can view the post$/) do
  expect(page).to within('h3') { have_content('Show Post') }
end

When(/^I edit the post$/) do
  click_on('Edit')
  fill_in 'Title', with: 'Title New'
  fill_in 'Content', with: 'Content New'
  click_on('Submit')
end

Then(/^The post is updated$/) do
  expect(page).to have_content('Logout Post was successfully updated.')
end

When(/^I log out$/) do
  click_on('Logout')
end

Then(/^I am logged out$/) do
  expect(page).to have_content 'You need to sign in or sign up before continuing.'
end

When(/^I log in with my accoutn information$/) do
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'password'
  within('form') { click_on('Log in') }
end

Then(/^I am logged in$/) do
  expect(page).to have_content 'Signed in successfully.'
end

When(/^I sign up with account information$/) do
  within('nav') { click_on('Sign up') }
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  within('form') { click_on('Sign up') }
end

Then(/^I am signed up$/) do
  expect(page).to have_content 'You have signed up successfully.'
end
