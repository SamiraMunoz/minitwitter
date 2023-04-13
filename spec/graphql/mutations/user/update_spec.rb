require 'rails_helper'

describe 'Update user', type: :request do
  let!(:user) { create(:user) }
  let!(:user_data) { query_user(user.id) }

  describe "Return user's information" do
    it { expect(user_data['firstName']).to eq('Juan') }
    it { expect(user_data['lastName']).to eq(user.last_name) }
    it { expect(user_data['nickname']).to eq(user.nickname) }
    it { expect(user_data['fullName']).to eq("Juan #{user.last_name}") }
  end

  it 'Verify the user is created' do
    expect(User.exists?(first_name: 'Juan')).to be_truthy
  end

  private

  def query_user(user_id)
    response = gql(mutation, query_variables(user_id))
    response.dig('data', 'updateUser')
  end

  def mutation
    <<-GQL
      mutation updateUser($user: UserInputType!){
        updateUser(user: $user){
          firstName
          lastName
          nickname
          fullName
        }
      }
    GQL
  end

  def query_variables(user_id)
    { "user" => { "id" => "#{user_id}", "firstName" => "Juan" }}
  end
end
