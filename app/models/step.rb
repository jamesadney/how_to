class Step < ActiveRecord::Base
  belongs_to :list
  attr_accessible :description, :stepnum

  validates :stepnum, :description, :presence => true
end
