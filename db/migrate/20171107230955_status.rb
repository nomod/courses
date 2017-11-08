class Status < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.string :status_name

      t.timestamps
    end
  end
end
