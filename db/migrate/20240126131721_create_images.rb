class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true
      t.string :kind
      t.boolean :purge, default: false
      t.timestamps null: false
    end
  end
end
