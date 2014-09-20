class AddForeginKeysToLove < ActiveRecord::Migration
  def change

    add_column :loves, :nagger_id, :integer
    add_column :loves, :complaint_id, :integer

  end
end
