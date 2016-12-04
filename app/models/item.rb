class Item < ActiveRecord::Base

  has_many :counts
  belongs_to :event
  belongs_to(:user, :class_name => "User", :foreign_key => "user_id")
end
