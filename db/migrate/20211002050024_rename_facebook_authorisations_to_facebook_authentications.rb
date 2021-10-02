class RenameFacebookAuthorisationsToFacebookAuthentications < ActiveRecord::Migration[6.1]
  def change
    rename_table :facebook_authorisations, :facebook_authentications
  end
end
