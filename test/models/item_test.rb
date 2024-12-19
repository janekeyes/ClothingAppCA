require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "Item valid if all criteria is chosen" do
    category = categories(:one)      
    item = Item.new(name: "Hoodie", size: "UK 8-10 (S)", description: "Womens graphic hoodie", category: category)
    assert item.valid?
  end

  test "Item invalid if not all criteria is chosen" do
    category = categories(:one)      
    item = Item.new(name: "Hoodie", description: "Womens graphic hoodie", category: category)
    assert_not item.valid?
  end

  test "Item invalid if category is not chosen" do
    item = items(:one) 
    assert_not_nil item.category
  end




