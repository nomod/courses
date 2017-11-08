class Users < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :surname
      t.string :email, index: true, unique: true
      t.string :password_digest
      t.string :remember_token, index: true
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end