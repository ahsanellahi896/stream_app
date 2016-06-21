class Channel < ActiveRecord::Base
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image
end
