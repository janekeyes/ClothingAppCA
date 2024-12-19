require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "should create item" do
    visit items_url
    click_on "New item"

    fill_in "Category", with: @item.category_id
    fill_in "Colour", with: @item.colour
    fill_in "Description", with: @item.description
    fill_in "Name", with: @item.name
    fill_in "Size", with: @item.size
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Category", with: @item.category_id
    fill_in "Colour", with: @item.colour
    fill_in "Description", with: @item.description
    fill_in "Name", with: @item.name
    fill_in "Size", with: @item.size
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "should delete Item" do
    visit item_url(@item)
    click_on "Delete this item", match: :first

    assert_text "Item was successfully deleted"
  end
end
