module Queries
  module Tweets
    class FetchTweets < Queries::BaseQuery

      argument :page, Integer, required: false
      argument :limit, Integer, required: false

      type Objects::TweetObject.collection_type, null: false

      def resolve(page: nil, limit: nil)
        Tweet.all.order(created_at: :desc).page(page).per(limit)
      end
    end
  end
end
