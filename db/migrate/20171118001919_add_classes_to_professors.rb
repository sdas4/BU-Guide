class AddClassesToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :classes, :string
  end
end
