class AddFilesToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :files, :json
  end
end
