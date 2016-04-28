ActiveRecord::Schema.define do
  create_table :notifs do |t|
    # Target is the object of the notification (like a Project, Donation or User)
    t.references :target, polymorphic: true, index: true
    t.belongs_to :user, index: true
    t.boolean :unread, index: true, default: true
    t.string :type
    t.timestamps null: false
  end

  create_table :users do |t|
    t.string :email
  end
end
