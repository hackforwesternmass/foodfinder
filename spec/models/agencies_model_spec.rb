require 'spec_helper'

describe Agency do
  it 'returns open given a datetime in which the agency is open' do
    @agency = Agency.new
    @agency.open_thr_am = true
    time = DateTime.new(2014, 6, 12) # thursday
    expect(@agency.is_open(time)).to eq true
  end

  it 'returns closed given a datetime in which the agency is closed' do
    @agency = Agency.new
    @agency.open_thr_am = false
    time = DateTime.new(2014, 6, 12) # thursday
    expect(@agency.is_open(time)).to eq false
  end

  it 'can differentiate between AM and PM' do
    @agency = Agency.new
    @agency.open_thr_am = true
    @agency.open_thr_pm = false
    am = DateTime.new(2014, 6, 12, 0, 0)
    pm = DateTime.new(2014, 6, 12, 13, 0)

    expect(@agency.is_open(am)).to eq true
    expect(@agency.is_open(pm)).to eq false
  end
end

