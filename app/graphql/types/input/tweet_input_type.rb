module Types
  module Input
    class TweetInputType < Types::BaseInputObject
      graphql_name "TweetInputType"

      description "All the attributes needed to create a tweet"

      argument :id, ID, required: false
      argument :content, String, required: false
      argument :author_id, ID, required: true
    end
  end
end
