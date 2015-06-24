class RemoveDefaultImage < ActiveRecord::Migration
  def change
    change_column_default(:tweets, :image, nil)
  end
end
