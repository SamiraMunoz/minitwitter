require 'rails_helper'

describe 'Destroy user', type: :request do
  let(:user) { create(:user) }
  let!(:id) { user.id }
  let!(:user_data) { query_user(id: id) }

  describe "Return user's information" do
    it { expect(user_data['id']).to eq(id.to_s) }
  end

  it 'Verify the user is created' do
    expect(User.exists?(id: id)).to_not be_truthy
  end

  private

  def query_user(id:)
    response = gql(mutation(id))
    response.dig('data', 'destroyUser')
  end

  def mutation(id)
    <<-GQL
      mutation{
        destroyUser(id: #{id}){
          id
        }
      }
    GQL
  end
end
