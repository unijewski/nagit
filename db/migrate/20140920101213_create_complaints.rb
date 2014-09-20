class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :name
      t.string :content
      t.string :url

      t.timestamps
    end
  end
end
