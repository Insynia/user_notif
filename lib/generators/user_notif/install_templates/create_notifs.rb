class CreateNotifs < ActiveRecord::Migration
  def change
    create_table :notifs do |t|
      # Target is the object of the notification (like a Project, Donation or User)
      t.references :target, polymorphic: true, index: true, null: false
      t.boolean :sticky, default: false
      t.belongs_to :user, index: true
      t.boolean :unread, index: true, default: true
      t.string :type
      t.timestamps
    end
  end
end