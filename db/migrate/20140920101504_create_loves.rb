class CreateLoves < ActiveRecord::Migration
  def change
    create_table :loves do |t|

      t.timestamps
    end
  end
end
