def add_comment(comment)
  fill_in 'Body', :with => comment.body
  click_on 'Create Comment'
end
