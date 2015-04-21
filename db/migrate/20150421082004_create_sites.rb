class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title, null: false 

      t.timestamps
    end
  end
end
