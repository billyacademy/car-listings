require 'rails_helper'

feature "a user creates a manufacturer", %q(
As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot
```

Acceptance Criteria:

[ x ] I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
[ x ] Only years from 1920 and above can be specified.
[ x ] I can optionally specify a description of the car.
[ x ] If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
[ x ] If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
[ x ] Upon successfully creating a car, I am redirected back to the index of cars.
) do

    scenario "salesperson successfully creates a car to be listed" do
      FactoryGirl.create(:manufacturer)

      visit new_car_path
      select 'Tonka', from: "Manufacturer"
      fill_in "Color", with: 'Blue'
      fill_in "Year", with: '1999'
      fill_in "Mileage", with: '100000'
      fill_in "Description", with: 'This is a trusty car'

      click_on "Submit"

      expect(page).to have_content "Car successfully created"
      expect(page).to have_content "This is a trusty car"
    end

    scenario "salesperson unsucessfully creates a car to be listed" do
      FactoryGirl.create(:manufacturer)

      visit new_car_path

      fill_in "Year", with: "1919"
      click_on "Submit"

      expect(page).to have_content "Color can't be blank"
      expect(page).to have_content "Year must be greater than 1919"
      expect(page).to have_content "Mileage can't be blank"
  end
end
