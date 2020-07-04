class ChangeDataTypeOfDescriptionToText < ActiveRecord::Migration[6.0]
  def change
    change_column :boats, :description, :text
  end
end
