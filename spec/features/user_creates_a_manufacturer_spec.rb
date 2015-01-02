require 'rails_helper'

feature "a user creates a manufacturer", %q(
As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot
```

Acceptance Criteria:
[ x ] I must specify a manufacturer name and country.
[ x ] If I do not specify the required information, I am presented with errors.
[ x ] If I specify the required information, the manufacturer is recorded and I am
redirected to the index of manufacturers
) do

  scenario "user successfully creates a manufacturer" do

    visit new_manufacturer_path
    fill_in "Name", with: 'Ford'
    fill_in "Country", with: 'USA'
    click_button "Submit"
    expect(page).to have_content "Manufacturer successfully created."
  end

  scenario "user unsuccessfully creates a manufaturer" do
    visit new_manufacturer_path
    fill_in "Name", with: 'Ford'

    click_button "Submit"
    expect(page).to have_content "Country can't be blank"
  end
end
