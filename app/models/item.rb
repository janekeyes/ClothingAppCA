class Item < ApplicationRecord
  belongs_to :category
  validates :name, :size, :description, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "colour", "created_at", "description", "id", "name", "size", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
