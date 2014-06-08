require 'csv'

class DataFile

  def self.parse(file)
    json = JSON.parse CSV.parse(file.read).to_json
    attributes = json[0]

    for obj in json
      # Skip headers
      next if obj[0] == "AgencyRef"

      agency_data = {}

      attributes.each_with_index do |a, i|
        agency_data[a.underscore] = obj[i]
      end

      if existing_agency = Agency.where(agency_ref: obj[0]).first
        existing_agency.update_attributes(agency_data)
      else
        Agency.create!(agency_data)
      end
    end
  end

end
