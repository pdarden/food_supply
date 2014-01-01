class InventoryItem < ActiveRecord::Base
  validates_presence_of :title, :description, :quantity
  validates_numericality_of :quantity, only_integer: true, greater_than_or_equal_to: 0
end
