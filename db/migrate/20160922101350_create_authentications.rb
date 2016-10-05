class CreateAuthentications < ActiveRecord::Migration[5.0]
  def change
    create_table :authentications do |t|
      t.string :auth_token
      t.references :user

      t.timestamps
    end
    add_index :authentications, :auth_token, unique: true
  end
end
