class Article < ApplicationRecord
  belongs_to :user
  has_many :tags, :dependent => :destroy
  has_many :pictures, as: :imageable
  has_and_belongs_to_many :catgories
end
