class AddCountOfLovesToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :loves_count, :integer, default: 0, null: false

    Complaint.find_each do |result|
      Complaint.reset_counters(result.id, :loves)
    end
  end

  def down
    remove_column :complaints, :loves_count
  end
end
