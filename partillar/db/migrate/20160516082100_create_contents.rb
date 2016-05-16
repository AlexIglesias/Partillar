class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :source
      t.string :title
      t.string :media_url
      t.text :description
      t.boolean :curated, default: false
      t.references :category

      t.timestamps null: false
    end
  end
end
