class Zipcode < ActiveRecord::Base
 
  has_one     :zone_member, :as => :zoneable
  has_one     :zone,        :through => :zone_member
  belongs_to :country

  named_scope :order_by_code, :order => :code
  
  validates_presence_of :code
  
  validates_uniqueness_of :code, :scope => :country_id
  
  def <=>(other)
    code <=> other.code
  end

  def to_s
    code.to_s
  end
end
