class AddLocationToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :location, :string
  end
end
