When(/^I submit a new post$/) do
  click_on('New Post')
  fill_in 'Title', with: 'Title'
  fill_in 'Content', with: 'Content'
  click_on('Submit')
end

Then(/^A new post is submited$/) do
  expect(page).to have_content("Post was successfully created.")
end

Given(/^There is a post$/) do
  post = Post.new(title: 'Title', content: 'Content', user_id: 1)
  post.save
end

When(/^I delete the post$/) do
  visit '/'
  click_on('Delete')
end

Then(/^The post is deleted$/) do
  expect(page).to have_content('Post was successfully deleted.')
end
