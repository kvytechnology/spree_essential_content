class AddAttachment2ToContents < ActiveRecord::Migration
  def change
    add_attachment :spree_contents, :attachment2
  end
end
