# frozen_string_literal: true

module Objects
  class TweetObject < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :author, Objects::UserObject, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def author
      RecordLoader.for(::User).load(object.author_id)
    end
  end
end
