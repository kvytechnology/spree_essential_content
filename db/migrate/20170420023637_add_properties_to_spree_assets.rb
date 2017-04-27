class AddPropertiesToSpreeAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_assets, :properties, :text
  end
end
