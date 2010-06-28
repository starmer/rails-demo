class Item < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :list
end
