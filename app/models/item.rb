class Item < ApplicationRecord
  belongs_to :category
  validates :name, :size, :colour, :description, presence: true
  has_one_attached :image

  # SIZES = ['UK 4-6 (XS)', 'UK 8-10 (S)', 'UK 12-14 (M)', 'UK 16-18 (L)', 'UK 20-22 (XL)']
  # COLOURS = ['Red', 'Orange', 'Yellow', 'Green',  'Blue', 'Purple', 'Pink', 'Gold', 'Silver', 'Grey', 'Multi', 'Tranparent', 'Black', 'White']
end
