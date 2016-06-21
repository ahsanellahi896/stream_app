class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.text :description
      t.string :category
      t.text :embed_code

      t.timestamps null: false
    end
  end
end
