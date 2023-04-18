module Queries
  module Tweets
    class FetchTweets < Queries::BaseQuery

      type [Objects::TweetObject], null: false

      def resolve
        Tweet.all.order(created_at: :desc)
      end
    end
  end
end
