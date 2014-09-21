class CreateCensorships < ActiveRecord::Migration
  def change
    create_table :censorships do |t|
      t.string :word

      t.timestamps
    end
  end
end
