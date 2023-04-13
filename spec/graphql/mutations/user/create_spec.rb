require 'rails_helper'

describe 'Create user', type: :request do
  let(:user) { build(:user) }
  let!(:user_data) { query_user(user) }

  describe "Return user's information" do
    it { expect(user_data['firstName']).to eq(user.first_name) }
    it { expect(user_data['lastName']).to eq(user.last_name) }
    it { expect(user_data['nickname']).to eq(user.nickname) }
  end

  it 'Verify the user is created' do
    expect(User.exists?(first_name: user.first_name)).to be_truthy
  end

  private

  def query_user(user_info)
    response = gql(mutation, query_variables(user_info))
    response.dig('data', 'createUser')
  end

  def mutation
    <<-GQL
      mutation createUser($user: UserInputType!){
        createUser(user: $user){
          firstName
          lastName
          nickname
        }
      }
    GQL
  end

  def query_variables(user_info)
    { "user" => user_info.attributes.except('id','created_at', 'updated_at')
                         .deep_transform_keys! {|key| key.to_s.camelize(:lower) } }
  end
end
