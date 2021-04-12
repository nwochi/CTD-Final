class CreateDanceToPhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :dance_to_phrases do |t|
      t.references :dance, foreign_key: true
      t.references :phrase, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
