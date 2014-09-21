class AddCountOfComplaintsToNaggers < ActiveRecord::Migration
  def change
    add_column :naggers, :complaints_count, :integer, default: 0, null: false

    Nagger.find_each do |result|
      Nagger.reset_counters(result.id, :complaints)
    end
  end

  def down
    remove_column :naggers, :complaints_count
  end
end
