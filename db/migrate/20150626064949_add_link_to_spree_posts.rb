class AddLinkToSpreePosts < ActiveRecord::Migration
  def change
    add_column :spree_posts, :link, :string
  end
end
