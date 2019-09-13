class CreateMyusers < ActiveRecord::Migration[5.0]
  def change
    create_table :myusers do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :watched

      t.timestamps
    end
  end
end
