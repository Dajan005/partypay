class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :items
   has_many :events
   has_many :counts


   # Validations

 validates :username, presence: true
 validates :username, uniqueness: true

end
