class CreateForumThreads < ActiveRecord::Migration[6.1]
  def change
    create_table :forum_threads do |t|
      t.integer :section_id
      t.string :title

      t.timestamps
    end
  end
end
