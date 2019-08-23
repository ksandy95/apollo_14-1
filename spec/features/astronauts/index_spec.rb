require 'rails_helper'
RSpec.describe "As a visitor, when i visit '/astronauts'. " do
  before :each do
    @joe = Astronaut.create!(name: "Joe", age: 37, job: "Space Chef")
    @larry = Astronaut.create!(name: "Larry", age: 32, job: "Commander")
    @moe = Astronaut.create!(name: "Moe", age: 28, job: "Pilot")
  end
  it "I see a list of astronauts with the following info: Name, Age, Job" do
    visit '/astronauts'

    expect(page).to have_content("Our Astronauts")

    within "#space-#{@moe.id}" do
      expect(page).to have_content("Name: Moe")
      expect(page).to have_content("Age: 28")
      expect(page).to have_content("Job: Pilot")
    end

    within "#space-#{@joe.id}" do
      expect(page).to have_content("Name: Joe")
      expect(page).to have_content("Age: 37")
      expect(page).to have_content("Job: Space Chef")
    end

    within "#space-#{@larry.id}" do
      expect(page).to have_content("Name: Larry")
      expect(page).to have_content("Age: 32")
      expect(page).to have_content("Job: Commander")
    end
  end
end
