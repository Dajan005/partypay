class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


# Associations

   has_many :items
   has_many :events


   # Validations

 validates :username, presence: true
 validates :username, uniqueness: true
 validates :first_name, presence: true
 validates :last_name, presence: true
 validates :Venmo, presence: true
 validates :Venmo, uniqueness: true
end
