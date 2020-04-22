require 'rails_helper'

RSpec.describe Restaurant, type: :model do
    it "is valid with valid name, address, city, state, and zip" do
        restaurant = Restaurant.new(
            name: "Restaurant 1",
            address: "123 Fake St",
            city: "Cambridge",
            state: "Massachussetts",
            zip: "00000"
        )

        expect(restaurant).to be_valid
    end

    it "is not valid without a name" do
        restaurant = Restaurant.new(
            address: "123 Fake St",
            city: "Cambridge",
            state: "Massachussetts",
            zip: "00000"
        )

        expect(restaurant).to_not be_valid
    end

    it "is not valid without an address" do
        restaurant = Restaurant.new(
            name: "Restaurant 1",
            city: "Cambridge",
            state: "Massachussetts",
            zip: "00000"
        )

        expect(restaurant).to_not be_valid
    end

     it "is not valid without a city" do
        restaurant = Restaurant.new(
            name: "Restaurant 1",
            address: "123 Fake St",
            state: "Massachussetts",
            zip: "00000"
        )

        expect(restaurant).to_not be_valid
    end

    it "is not valid without a state" do
        restaurant = Restaurant.new(
            name: "Restaurant 1",
            address: "123 Fake St",
            city: "Cambridge",
            zip: "00000"
        )

        expect(restaurant).to_not be_valid
    end

    it "is not valid without a zip" do
        restaurant = Restaurant.new(
            name: "Restaurant 1",
            address: "123 Fake St",
            city: "Cambridge",
            state: "Massachussetts"
        )

        expect(restaurant).to_not be_valid
    end
end