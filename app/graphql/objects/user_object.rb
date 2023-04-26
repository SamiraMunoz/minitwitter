# frozen_string_literal: true

module Objects
  class UserObject < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :nickname, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :full_name, String, null: true
    field :email, String, null: false
  end
end
