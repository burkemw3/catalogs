class Publisher < ActiveRecord::Base
  belongs_to :user
  has_many :catalogs
  has_many :boxes, :through => :catalogs
  has_many :calls

  validates_format_of :phone, :with => /^\d{3}-\d{3}-\d{4}$/, :message => 'Must be in 000-000-0000 format'

  def self.search(search)
     if search
       if Rails.env.production?
         # differences between PG and SQLite suck
         find(:all, :conditions => ['name ILIKE ? OR phone LIKE ?', "%#{search}%", "%#{search}%"], :order => "should_call DESC")
       else
         find(:all, :conditions => ['name LIKE ? OR phone LIKE ?', "%#{search}%", "%#{search}%"], :order => "should_call DESC")
       end
     else
       find(:all, :order => "should_call DESC")
     end
  end

  def events
     (catalogs + calls).sort_by(&:date).reverse
  end

  def call_list
    find(:all, :conditions => { should_call => true }, :include => [:catalogs, :boxes])
  end
end
