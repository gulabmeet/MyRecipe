class CreateIngredientStyles < ActiveRecord::Migration
  def change
    create_table :ingredient_styles do |t|
      t.integer :ingredient_id, :style_id
    end
  end
end
