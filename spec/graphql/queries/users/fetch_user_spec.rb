require 'rails_helper'

describe 'Fetch user', type: :request do
  let(:user) { create(:user) }
  let(:user_data) { query_user(id: user.id)}

  describe "Return user's information" do
    it { expect(user_data['firstName']).to eq(user.first_name) }
    it { expect(user_data['lastName']).to eq(user.last_name) }
    it { expect(user_data['nickname']).to eq(user.nickname) }
  end

  private

  def query_user(id:)
    response = gql(<<-GQL
        query {
          fetchUser(id: #{id}) {
            id
            firstName
            lastName
            nickname
          }
        }
      GQL
    )
    response.dig('data', 'fetchUser')
  end
end
