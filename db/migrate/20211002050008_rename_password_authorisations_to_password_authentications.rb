class RenamePasswordAuthorisationsToPasswordAuthentications < ActiveRecord::Migration[6.1]
  def change
    rename_table :password_authorisations, :password_authentications
  end
end
