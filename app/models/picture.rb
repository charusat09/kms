class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
