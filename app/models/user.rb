class User < ActiveRecord::Base
  has_many :authentications
  has_many :publishers
  has_many :catalogs, :through => :publishers
  has_many :boxes, :through => :catalogs
  has_many :calls, :through => :publishers
end
