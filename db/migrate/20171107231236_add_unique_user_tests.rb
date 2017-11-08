class AddUniqueUserTests < ActiveRecord::Migration[5.0]
  def change
    add_index :user_tests, [:user_id, :test_id, :status_id], unique: true
  end
end
