class CreateNeurons < ActiveRecord::Migration
  def change
    create_table :neurons do |t|
      t.text :body
      t.string :url

      t.timestamps
    end
  end
end
