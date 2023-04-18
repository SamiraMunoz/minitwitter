require 'rails_helper'

describe 'Create tweet', type: :request do
  let!(:user) { create(:user) }
  let(:tweet) { build(:tweet, author: user) }
  let!(:tweet_data) { query_tweet(tweet) }

  describe "Return tweet's information" do
    it { expect(tweet_data['content']).to eq(tweet.content) }
    it { expect(tweet_data['author']['firstName']).to eq(user.first_name) }
    it { expect(tweet_data['author']['lastName']).to eq(user.last_name) }
  end

  it 'Verify the tweet is created' do
    expect(Tweet.exists?(content: tweet.content, author: user)).to be_truthy
  end

  private

  def query_tweet(tweet_info)
    response = gql(mutation, query_variables(tweet_info))
    response.dig('data', 'createTweet')
  end

  def mutation()
    <<-GQL
      mutation createTweet($tweet: TweetInputType!){
        createTweet(tweet: $tweet){
          id
          content
          author {
            firstName
            lastName
          }
        }
    }
    GQL
  end

  def query_variables(tweet_info)
    { "tweet" => tweet_info.attributes.except('id','created_at', 'updated_at')
                         .deep_transform_keys! {|key| key.to_s.camelize(:lower) } }
  end
end
