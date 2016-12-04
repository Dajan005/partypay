class Count < ActiveRecord::Base

  belongs_to :item
  belongs_to(:user, :class_name => "User", :foreign_key => "user_id")
  

end
