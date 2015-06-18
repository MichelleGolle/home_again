class AddTweetIdToMedium < ActiveRecord::Migration
  def change
    add_column :media, :tweet_id, :integer
  end
end
