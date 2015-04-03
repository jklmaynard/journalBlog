def sign_in(user)
  visit user_session_path
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
  click_on 'Log in'
end

def add_comment(comment)
  click_on 'Add Comment'
  fill_in 'Body', :with => comment.body
  click_on 'Create Comment'
end
