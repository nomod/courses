class UserTests < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tests do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :status_id

      t.timestamps
    end
  end
end
