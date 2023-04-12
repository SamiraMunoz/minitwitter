module Queries
  module Users
    class FetchUsers < Queries::BaseQuery

      type [Objects::UserObject], null: false

      def resolve
        User.all.order(created_at: :desc)
      end
    end
  end
end
