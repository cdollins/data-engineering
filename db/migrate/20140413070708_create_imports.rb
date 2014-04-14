class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :data
      t.decimal :total, default: 0

      t.timestamps
    end
  end
end
