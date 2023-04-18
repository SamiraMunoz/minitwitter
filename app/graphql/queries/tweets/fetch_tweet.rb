module Queries
  module Tweets
    class FetchTweet < Queries::BaseQuery
      type Objects::TweetObject, null: false
      argument :id, ID, required: true

      def resolve(id:)
        Tweet.find(id)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Tweet does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
