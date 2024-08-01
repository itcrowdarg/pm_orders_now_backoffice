class CreateNormalUserTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :normal_user_tokens do |t|
      t.references :normal_user, foreign_key: { to_table: :users }, index: true
      t.text :access_token
      t.text :refresh_token
      t.datetime :datetime_expiration

      t.timestamps null: false
    end
  end
end
