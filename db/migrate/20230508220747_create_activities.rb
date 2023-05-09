class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :project, null: false, foreign_key: true
      t.references :trackable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
