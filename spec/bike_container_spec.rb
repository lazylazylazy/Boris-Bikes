require_relative '../lib/docking_station'
require_relative '../lib/bike_container'
require_relative '../lib/bike'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it 'should accept a bike' do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end	
		it 'should release a bike' do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end
		it 'should know when it is full' do
		expect(holder).not_to be_full
		fill_holder holder 
		expect(holder).to be_full
	end
		it 'should not accept a bike if it is full' do
		fill_holder holder
		expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
	end

	it 'should provide the list of bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	def fill_holder(holder)
	holder.capacity.times { holder.dock(Bike.new) }
	end
end

describe DockingStation do

	let (:station) { DockingStation.new(:capacity => 123) }

	it 'should allow setting default capacity on initialising' do
		expect(station.capacity).to eq(123)
	end

end