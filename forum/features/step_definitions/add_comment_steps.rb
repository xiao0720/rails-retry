When(/^I add a comment to it$/) do
  click_on('Show')
  click_on('Reply')
  fill_in 'Content', with: 'Content'
  click_on('Submit')
end

Then(/^The post has a comment$/) do
  expect(page).to have_content('Comment is succesfully posted.')
end

Given(/^There is a comment to the post$/) do
  @comment = Comment.new(content: 'Content', user_id: 1, post_id: 1)
  @comment.save
end

When(/^I add a comment to the comment$/) do
  click_on('Show')
  within('p#' + @comment.id.to_s) { click_on('Reply') }
  fill_in 'Content', with: 'Subcomment'
  click_on('Submit')
end

Then(/^The comment has a comment$/) do
  expect(page).to have_content('Subcomment')
end
