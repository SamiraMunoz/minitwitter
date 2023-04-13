require 'rails_helper'

describe 'Fetch user', type: :request do
  let!(:user_1) { create(:user, created_at: Time.now - 1.day) }
  let!(:user_2) { create(:user, created_at: Time.now - 2.day) }
  let!(:user_3) { create(:user) }

  let(:users_data) { query_user }

  let(:expected_array){
    [
      {
        "id" => user_3.reload.id.to_s,
        "firstName" => user_3.first_name,
        "lastName" => user_3.last_name,
        "nickname" => user_3.nickname
      },
      {
        "id" => user_1.reload.id.to_s,
        "firstName" => user_1.first_name,
        "lastName" => user_1.last_name,
        "nickname" => user_1.nickname
      },
      {
        "id" => user_2.reload.id.to_s,
        "firstName" => user_2.first_name,
        "lastName" => user_2.last_name,
        "nickname" => user_2.nickname
      }
    ]
  }

  it "Return users's information" do
    expect(expected_array).to eq(users_data)
  end

  private

  def query_user
    response = gql(<<-GQL
        query {
          fetchUsers {
            id
            firstName
            lastName
            nickname
          }
        }
      GQL
    )
    response.dig('data', 'fetchUsers')
  end
end
