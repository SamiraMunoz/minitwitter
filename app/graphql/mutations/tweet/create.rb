module Mutations
  module Tweet
    class Create < GraphQL::Schema::Mutation
      argument :tweet, Types::Input::TweetInputType, required: true

      def resolve(tweet:)
        tweet_params = Hash tweet
        begin
          ::Tweet.create!(tweet_params)
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end
