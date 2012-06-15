class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.boolean :active, :default => false
      t.text :body
      t.integer :video_id

      t.timestamps
    end
  end
end
