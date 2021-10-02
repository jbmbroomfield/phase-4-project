class RenameAuthorisationsToPasswordAuthorisations < ActiveRecord::Migration[6.1]
  def change
    rename_table :authorisations, :password_authorisations
  end
end
