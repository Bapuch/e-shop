require 'test_helper'

class TableItemTest < ActiveSupport::TestCase
  def setup
    @item = TableItem.new(title: "Example Item")
  end
#test to find if the item titele is uniq
  test "title should be unique" do
    duplicate_item = @item.dup
    assert_not duplicate_item.valid?
  end

#  test "title should be unique" do
#    duplicate_item = @item.dup
#    @item.save(validate: false)
#    duplicate_item.valid? # need this to populate errors
#    assert duplicate_item.errors
#    assert duplicate_item.errors[:title]
#  end
#test if item is save without title

  test 'invalid without title' do
    @item.title = nil
    refute @item.valid?, 'saved item without a title'
    assert_not_nil @item.errors[:title], 'no validation error for title present'
  end


end
