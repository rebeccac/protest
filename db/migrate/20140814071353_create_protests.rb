class CreateProtests < ActiveRecord::Migration
  def change
    create_table :protests do |t|
      t.string :title
      t.date :date
      t.time :time
      t.string :starting_location
      t.string :state
      t.string :organisation
      t.text :more_info
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :email
      t.boolean :visible, default: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
