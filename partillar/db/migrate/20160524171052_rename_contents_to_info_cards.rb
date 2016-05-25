class RenameContentsToInfoCards < ActiveRecord::Migration
  def change
    rename_table :contents, :infocards
  end
end
