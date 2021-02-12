class CreateCutTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :cut_times do |t|

      t.integer :second
      t.integer :minute
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
