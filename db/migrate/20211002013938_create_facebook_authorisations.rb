class CreateFacebookAuthorisations < ActiveRecord::Migration[6.1]
  def change
    create_table :facebook_authorisations do |t|
      t.integer :user_id
      t.string :uid

      t.timestamps
    end
  end
end
