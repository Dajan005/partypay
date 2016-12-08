class Event < ActiveRecord::Base

  mount_uploader :receipt, ReceiptUploader

# Associations
  has_many :items
  has_many :counts
  belongs_to(:user, :class_name => "User", :foreign_key => "user_id")

# Validations
  validates :user_id, presence: true
  validates :title, presence: true

end
