module Types
  class MutationType < Types::BaseObject
    field :create_user, Types::UserType, mutation: Mutations::User::Create, description: 'Create a user'
    field :update_user, Types::UserType, mutation: Mutations::User::Update, description: 'Update a user'
    field :destroy_user, mutation: Mutations::User::Destroy, description: 'Destroy a user'
  end
end
