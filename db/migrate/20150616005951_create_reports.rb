class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :original_message
      t.integer :protocol_version
      t.integer :trap_id
      t.timestamp :sent_at

      t.timestamps null: false
    end
  end
end
