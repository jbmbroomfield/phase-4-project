class CreateAuthorisations < ActiveRecord::Migration[6.1]
  def change
    create_table :authorisations do |t|
      t.integer :user_id
      t.string :password_digest

      t.timestamps
    end
  end
end
