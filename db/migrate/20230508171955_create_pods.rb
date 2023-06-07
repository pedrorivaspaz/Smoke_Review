class CreatePods < ActiveRecord::Migration[7.0]
  def change
    create_table :pods do |t|
      t.string :flavor
      t.string :brand
      t.string :description
      t.string :url_image

      t.timestamps
    end
  end
end
