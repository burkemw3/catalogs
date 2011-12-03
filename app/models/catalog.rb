class Catalog < ActiveRecord::Base
  belongs_to :publisher
  has_many :boxes
end
