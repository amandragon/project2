class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.string :distance
      t.has_many :users

      t.timestamps
    end
  end
end
