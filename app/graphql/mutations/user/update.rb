module Mutations
  module User
    class Update < GraphQL::Schema::Mutation
      argument :user, Types::Input::UserInputType, required: true

      def resolve(user:)
        user_params = Hash user
        id = user_params[:id]

        begin
          find_user(id).update(user_params)
          @user
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end

      def find_user(id)
        @user ||= ::User.find(id)
      end
    end
  end
end
