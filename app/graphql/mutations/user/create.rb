module Mutations
  module User
    class Create < GraphQL::Schema::Mutation
      argument :user, Types::Input::UserInputType, required: true

      def resolve(user:)
        user_params = Hash user
        begin
          ::User.create!(user_params)
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end
