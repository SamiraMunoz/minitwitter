module Queries
  module Users
    class FetchUser < Queries::BaseQuery
      type Objects::UserObject, null: false
      argument :id, ID, required: true

      def resolve(id:)
        User.find(id)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('User does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
