class Agency < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  geocoded_by :full_street_address

  after_validation :geocode, on: :create

  def full_street_address
    [address, city, state].join(', ')
  end

  def is_open(time=Time.now)
    day_of_week = time.strftime('%A')
    am_pm = time.strftime('%p')

    if am_pm == 'AM'
      if day_of_week == "Monday"
        self.open_mon_am
      elsif day_of_week == "Tuesday"
        self.open_tue_am
      elsif day_of_week == "Wednesday"
        self.open_wed_am
      elsif day_of_week == "Thursday"
        self.open_thr_am
      elsif day_of_week == "Friday"
        self.open_fri_am
      elsif day_of_week == "Saturday"
        self.open_sat_am
      elsif day_of_week == "Sunday"
        self.open_sun_am
      else
        false
      end
    else
      if day_of_week == "Monday"
        self.open_mon_pm
      elsif day_of_week == "Tuesday"
        self.open_tue_pm
      elsif day_of_week == "Wednesday"
        self.open_wed_pm
      elsif day_of_week == "Thursday"
        self.open_thr_pm
      elsif day_of_week == "Friday"
        self.open_fri_pm
      elsif day_of_week == "Saturday"
        self.open_sat_pm
      elsif day_of_week == "Sunday"
        self.open_sun_pm
      else
        false
      end
    end
  end
end
