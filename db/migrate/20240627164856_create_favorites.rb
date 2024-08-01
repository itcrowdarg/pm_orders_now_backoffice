class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.references :normal_user, foreign_key: { to_table: :users }, index: true
      t.references :favoritable, polymorphic: true

      t.timestamps
    end
  end
end
