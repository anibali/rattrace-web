class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :original_message
      t.integer :trap_id

      t.timestamps null: false
    end
  end
end
