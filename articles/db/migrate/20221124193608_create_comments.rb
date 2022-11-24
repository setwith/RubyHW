class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :status, default: 0
      t.references :articles, foreign_key: true
      t.references :authors, foreign_key: true

      t.timestamps
    end
  end
end
