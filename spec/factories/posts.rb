FactoryGirl.define do
  factory :post do
    title "The cat is alive"
    body "The cat is dead"

    factory :post_with_comments do
      ignore do
        posts_count 5
      end

      after(:create) do |post, evaluator|
        FactoryGirl.create_list(:comment, evaluator.posts_count, post: post)
      end
    end
  end
end
