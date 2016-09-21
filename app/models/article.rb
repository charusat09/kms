class Article < ApplicationRecord
  belongs_to :user
  has_many :tags, :dependent => :destroy
  has_many :pictures, as: :imageable
  has_and_belongs_to_many :catgories
  accepts_nested_attributes_for :pictures

  validates :title, presence: true
  validates :s_description, presence: true
end
