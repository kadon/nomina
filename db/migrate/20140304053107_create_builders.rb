class CreateBuilders < ActiveRecord::Migration
  def change
    create_table :builders do |t|
      t.integer :status
      t.string :comments

      t.timestamps
    end
  end
end
