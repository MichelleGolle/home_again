class AddImageToTweets < ActiveRecord::Migration
  def change
    change_column_default(:tweets, :image, 'unavailable.jpg')
  end
end
