class CreateComplaintCategories < ActiveRecord::Migration
  def change
    create_table :complaint_categories do |t|
      t.integer :complaint_id
      t.integer :category_id

      t.timestamps
    end
  end
end
