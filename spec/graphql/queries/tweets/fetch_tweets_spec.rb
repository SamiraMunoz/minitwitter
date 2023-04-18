require 'rails_helper'

describe 'Fetch user', type: :request do
  let(:user) { create(:user) }

  let!(:tweet_1) { create(:tweet, created_at: Time.now - 1.day, author: user) }
  let!(:tweet_2) { create(:tweet, created_at: Time.now - 2.day, author: user) }
  let!(:tweet_3) { create(:tweet, author: user) }

  let(:tweets_data) { query_tweet }

  let(:expected_array){
    [
      {
        "id" => tweet_3.reload.id.to_s,
        "content" => tweet_3.content,
        "author" => {
          "firstName" => user.first_name
        }
      },
      {
        "id" => tweet_1.reload.id.to_s,
        "content" => tweet_1.content,
        "author" => {
          "firstName" => user.first_name
        }
      },
      {
        "id" => tweet_2.reload.id.to_s,
        "content" => tweet_2.content,
        "author" => {
          "firstName" => user.first_name
        }
      }
    ]
  }

  it "Return users's information" do
    expect(expected_array).to eq(tweets_data)
  end

  private

  def query_tweet
    response = gql(<<-GQL
        query {
          fetchTweets {
            id
            content
            author {
              firstName
            }
          }
        }
      GQL
    )
    response.dig('data', 'fetchTweets')
  end
end
