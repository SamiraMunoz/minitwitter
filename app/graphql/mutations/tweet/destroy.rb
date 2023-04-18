module Mutations
  module Tweet
    class Destroy < GraphQL::Schema::Mutation
      field :id, ID, null: true
      argument :id, ID, required: true

      def resolve(id:)
        ::Tweet.find(id).destroy
        {
          id: id,
        }
      end
    end
  end
end
