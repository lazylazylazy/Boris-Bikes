require_relative '../lib/bike'
require_relative '../lib/docking_station'

describe Bike do
	let(:bike) { Bike.new } 
	it 'should not be broken after we create it' do
		expect(bike).not_to be_broken
	end
	it 'should be able to break' do
		bike.break
		expect(bike).to be_broken
	end
	it 'should be able to get fixed' do
		bike.break
		bike.fix
		expect(bike).not_to be_broken
	end
end

describe DockingStation do
	bike = Bike.new
	station = DockingStation.new
	expect(station.bike_count).to eq(0)
	station.dock(bike)
	expect(station.bike_count).to eq(1)
	end
end

