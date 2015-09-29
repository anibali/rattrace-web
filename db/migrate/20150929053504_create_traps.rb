class CreateTraps < ActiveRecord::Migration
  def change
    create_table :traps do |t|

      t.timestamps null: false
    end
  end
end
