FactoryGirl.define do

  factory(:user) do
    sequence(:email) { |n| "jklm#{n}@jklm.com"}
    password("12345678")
  end


  factory(:post) do
    title('This post')
    body('Some text')
    user
  end

  factory(:comment) do
    body('A mean remark')
    user
    post
  end
end
