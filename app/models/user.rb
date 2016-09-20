class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  has_one :picture, as: :imageable
  has_many :articles, :dependent => :destroy
  accepts_nested_attributes_for :picture
end
