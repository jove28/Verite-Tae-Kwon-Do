class Product < ActiveRecord::Base
  has_many :order_items
  mount_uploader :image, ImageUploader

  default_scope { where(active: true) }
end