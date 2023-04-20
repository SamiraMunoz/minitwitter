require 'rails_helper'

describe 'Fetch user', type: :request do
  let!(:user) { create(:user) }
  let(:access_token) { query_token(user)}
  let(:user_data) { query_user(id: user.id, token: access_token)}

  describe "Return user's information" do
    it { expect(user_data['firstName']).to eq(user.first_name) }
    it { expect(user_data['lastName']).to eq(user.last_name) }
    it { expect(user_data['nickname']).to eq(user.nickname) }
  end

  private

  def query_user(id:, token:)
    headers = { "Authorization": "Bearer #{token}" }
    response = gql(query(id), nil, headers)
    response.dig('data', 'fetchUser')
  end

  def query(id:)
    <<-GQL
      query {
        fetchUser(id: #{id}) {
          id
          firstName
          lastName
          nickname
        }
      }
    GQL
  end

  def query_token(user_info)
    binding.pry
    response = gql(login, query_variables(user_info), nil)
    response.dig('userLogin', 'credentials', 'accessToken')
  end

  def login
    <<-GQL
      mutation UserLogin($email: String!, $password: String!) {
        userLogin(
          email: $email,
          password: $password
        ) {
          credentials { accessToken uid tokenType client expiry }
        }
      }
    GQL
  end

  def query_variables(user_info)
    {
      "email": user_info.email,
      "password": user_info.password
    }
  end
end
