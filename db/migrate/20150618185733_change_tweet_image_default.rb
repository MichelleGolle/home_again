class ChangeTweetImageDefault < ActiveRecord::Migration
  def change
    change_column :tweets, :image, :image
  end
end
