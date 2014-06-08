class Agency < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  geocoded_by :full_street_address

  after_validation :geocode, on: :create

  def full_street_address
    [address, city, state].join(', ')
  end

end
