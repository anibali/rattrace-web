class CreateReportChunks < ActiveRecord::Migration
  def change
    create_table :report_chunks do |t|
      t.integer :trap_id
      t.integer :chunk_type
      t.timestamp :generated_at
      t.text :data

      t.timestamps null: false
    end
  end
end
