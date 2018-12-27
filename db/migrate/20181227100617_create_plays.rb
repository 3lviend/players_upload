class CreatePlays < ActiveRecord::Migration[5.1]
  def change
    create_table :plays do |t|
      t.references :image
      t.string :second

      t.timestamps
    end
  end
end
