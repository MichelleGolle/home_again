require 'rails_helper'


RSpec.describe Tweet, type: :model do
  it {should validate_presence_of :screen_name}
  it {should validate_presence_of :text}
  it {should validate_presence_of :url}
  it {should validate_presence_of :posted_at}

  it 'can be created' do |variable|
    t = Tweet.create(screen_name: "mg", url: "mg@tweet.example", posted_at: "6", text: "sampletext")

    expect(t.screen_name).to eq("mg")
    expect(t.text).to eq("sampletext")
    expect(t.url).to eq("mg@tweet.example")
    expect(t.posted_at).to eq("6")
  end

  it 'can be cleared' do
    t = Tweet.create(screen_name: "mg", url: "mg@tweet.example", posted_at: "6", text: "sampletext")
    Tweet.clear_database

    expect(Tweet.all).to be_empty
  end

end
