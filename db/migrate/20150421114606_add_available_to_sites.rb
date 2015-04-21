class AddAvailableToSites < ActiveRecord::Migration
  def change
    add_column :sites, :available, :boolean, default: false
  end
end
