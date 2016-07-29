class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :image
      t.text :description
      t.integer :amount_expected
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
