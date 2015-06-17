class AddTweetsTable < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :screen_name
      t.string :text
    end
  end
end
