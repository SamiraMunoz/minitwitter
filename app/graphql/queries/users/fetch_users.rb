module Queries
  module Users
    class FetchUsers < Queries::BaseQuery

      argument :page, Integer, required: false
      argument :limit, Integer, required: false

      type Objects::UserObject.collection_type, null: true

      def resolve(page: nil, limit: nil)
        User.all.order(created_at: :desc).page(page).per(limit)
      end
    end
  end
end
