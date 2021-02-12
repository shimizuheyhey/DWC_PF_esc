class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id#フォローする
      t.integer :followed_id#フォローされる

      t.timestamps
    end
  end
end
