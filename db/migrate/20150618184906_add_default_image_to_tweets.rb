class AddDefaultImageToTweets < ActiveRecord::Migration
  def change
    rename_column :tweets, :location, :image
  end
end
