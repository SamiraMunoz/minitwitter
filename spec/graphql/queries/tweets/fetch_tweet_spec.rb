require 'rails_helper'

describe 'Fetch tweet', type: :request do
  let(:tweet) { create(:tweet) }
  let!(:author) { tweet.author }
  let(:tweet_data) { query_tweet(id: tweet.id)}

  describe "Return tweet's information" do
    it { expect(tweet_data['content']).to eq(tweet.content) }
    it { expect(tweet_data['author']['firstName']).to eq(author.first_name) }
    it { expect(tweet_data['author']['lastName']).to eq(author.last_name) }
  end

  private

  def query_tweet(id:)
    response = gql(<<-GQL
        query {
          fetchTweet(id: #{id}) {
            id
            content
            author{
              firstName
              lastName
            }
          }
        }
      GQL
    )
    response.dig('data', 'fetchTweet')
  end
end
