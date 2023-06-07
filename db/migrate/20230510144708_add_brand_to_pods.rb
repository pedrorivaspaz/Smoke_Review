class AddBrandToPods < ActiveRecord::Migration[7.0]
  def change
    add_reference :pods, :brand, foreign_key: true
  end
end
