class AddInLatestImportToAgency < ActiveRecord::Migration
  def change
    add_column :agencies, :in_latest_import, :boolean, default: true
  end
end
