module Types
  module Input
    class UserInputType < Types::BaseInputObject
      graphql_name "UserInputType"

      description "All the attributes needed to create a user"

      argument :id, ID, required: false
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :nickname, String, required: false
    end
  end
end
