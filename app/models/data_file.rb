require 'csv'

class DataFile

  def self.parse(file)
    Agency.delete_all

    json = JSON.parse CSV.parse(file.read).to_json

    attributes = json[0]
    agencies = []

    for obj in json
      # Skip headers if present
      next if obj[0] == "AgencyRef"

      agency = {}

      attributes.each_with_index do |a, i|
        agency[a.underscore] = obj[i]
      end

      Agency.create!(agency)

      agencies << agency
    end

    agencies
  end

end
