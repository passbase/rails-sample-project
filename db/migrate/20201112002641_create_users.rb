class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :verified_status
      t.string :email
      t.string :identity_access_key

      t.timestamps
    end
  end
end
