class AddProjectToProducts < ActiveRecord::Migration
  def change
    add_column :products, :project, :string
  end
end
