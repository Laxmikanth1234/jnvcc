class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :story
      t.datetime :when
      t.text :where
      t.text :contact
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
