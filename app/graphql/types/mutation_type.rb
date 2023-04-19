module Types
  class MutationType < Types::BaseObject
    field_class GraphqlDevise::Types::BaseField

    field :create_user, Objects::UserObject, mutation: Mutations::User::Create, description: 'Create a user'
    field :update_user, Objects::UserObject, mutation: Mutations::User::Update, description: 'Update a user'
    field :destroy_user, mutation: Mutations::User::Destroy, description: 'Destroy a user'

    field :create_tweet, Objects::TweetObject, mutation: Mutations::Tweet::Create, description: 'Create a tweet'
    field :destroy_tweet, mutation: Mutations::Tweet::Destroy, description: 'Destroy a tweet'
  end
end
