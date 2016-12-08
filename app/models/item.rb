class Item < ActiveRecord::Base


# Associations
  belongs_to :event
  belongs_to(:user, :class_name => "User", :foreign_key => "user_id")

  # Validations

validates :name, presence: true
validates :price, presence: true
validates :quantity, presence: true
validates :event_id, presence: true
validates :user_id, presence: true

end
