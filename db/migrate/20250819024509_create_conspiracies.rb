class CreateConspiracies < ActiveRecord::Migration[7.1]
  def change
    create_table :conspiracies do |t|
      t.string :title
      t.text :content
      t.date :posted_on
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
