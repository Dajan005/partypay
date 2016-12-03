class Event < ActiveRecord::Base

  mount_uploader :receipt, ReceiptUploader

  has_many :items


  belongs_to(:user, :class_name => "User", :foreign_key => "user_id")


  validates :user_id, presence: true

end
