module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field_class GraphqlDevise::Types::BaseField
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :fetch_users, resolver: Queries::Users::FetchUsers
    field :fetch_user, resolver: Queries::Users::FetchUser, authenticate: false

    field :fetch_tweets, resolver: Queries::Tweets::FetchTweets
    field :fetch_tweet, resolver: Queries::Tweets::FetchTweet
  end
end
