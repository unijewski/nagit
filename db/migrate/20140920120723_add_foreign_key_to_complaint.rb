class AddForeignKeyToComplaint < ActiveRecord::Migration
  def change

    add_column :complaints, :nagger_id, :integer

  end
end
