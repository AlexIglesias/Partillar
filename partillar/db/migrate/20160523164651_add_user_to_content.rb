class AddUserToContent < ActiveRecord::Migration
  def change
    add_reference :contents, :user
  end
end
