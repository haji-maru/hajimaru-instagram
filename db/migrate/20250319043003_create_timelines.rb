class CreateTimelines < ActiveRecord::Migration[6.0]
  def change
    create_table :timelines do |t|
      t.references :user, null: false
      t.datetime :posttime
      t.text :content
      t.timestamps
    end
  end
end
