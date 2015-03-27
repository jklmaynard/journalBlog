FactoryGirl.define do

  factory(:post) do
    title('This post')
    body('Some text')
  end

  factory(:comment) do
    body('A mean remark')
    post_id(1)
  end
end
