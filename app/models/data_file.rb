require 'csv'

class DataFile

  def self.parse(file)
    json = JSON.parse CSV.parse(file.read).to_json
    attributes = json[0]

    Agency.update_all(in_latest_import: false)

    for obj in json
      # Skip headers
      next if obj[0] == "AgencyRef"

      agency_data = {}

      attributes.each_with_index do |a, i|
        agency_data[a.underscore] = obj[i]
      end
      agency_data[:in_latest_import] = true

      if existing_agency = Agency.where(agency_ref: obj[0]).first
        existing_agency.update_attributes(agency_data)
      else
        Agency.create!(agency_data)
      end
    end

    if Agency.where(in_latest_import: true).count >= 1
      Agency.where(in_latest_import: false).delete_all
    else
      raise IOError, "No data found in Agency import."
    end
  end

end
