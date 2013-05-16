class List < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :steps, :dependent => :delete_all
end
