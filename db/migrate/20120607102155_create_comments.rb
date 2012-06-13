class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.boolean :active
      t.text :body

      t.timestamps
    end
  end
end
