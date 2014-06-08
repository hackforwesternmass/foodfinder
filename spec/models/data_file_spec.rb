require 'spec_helper'

describe 'DataFile' do
  let(:single_row_data) do
<<-DATA
AgencyRef,address,city,state
"002","123 Main St.","Amherst","MA"
DATA
end
  before(:each) do
    Agency.delete_all
  end

  context '.parse' do
    it 'ignores the header row' do
      file = double('dummy header file', read: 'AgencyRef')
      DataFile.parse(file)
      expect(Agency.all.count).to eq 0
    end

    it 'adds a single record' do
      file = double('single line file', read: single_row_data)
      DataFile.parse(file)
      agency = Agency.all.first
      expect(agency.agency_ref).to eq '002'
      expect(agency.address).to eq '123 Main St.'
      expect(agency.city).to eq 'Amherst'
      expect(agency.state).to eq 'MA'
    end
  end
end
