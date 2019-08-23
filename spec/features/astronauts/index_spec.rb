require 'rails_helper'
RSpec.describe "As a visitor, when i visit '/astronauts'. " do
  before :each do
    @joe = Astronaut.create!(name: "Joe", age: 37, job: "Space Chef")
    @larry = Astronaut.create!(name: "Larry", age: 32, job: "Commander")
    @moe = Astronaut.create!(name: "Moe", age: 28, job: "Pilot")

    @eve_1 = Mission.create!(title: "Eve 1", time_in_space: 260)
    @exon_retreat = Mission.create!(title: "Exon Annual Space Retreat 15", time_in_space: 6)
    @mars_10 = Mission.create!(title: "Mars 10", time_in_space: 503)
    @zlorg = Mission.create!(title: "Zlorg", time_in_space: 1118)

    @a_m_1 = AstronautMission.create!(astronaut_id: @moe.id, mission_id: @eve_1.id)
    @a_m_2 = AstronautMission.create!(astronaut_id: @moe.id, mission_id: @exon_retreat.id)
    @a_m_3 = AstronautMission.create!(astronaut_id: @moe.id, mission_id: @mars_10.id)
    @a_m_4 = AstronautMission.create!(astronaut_id: @moe.id, mission_id: @zlorg.id)
    @a_m_5 = AstronautMission.create!(astronaut_id: @joe.id, mission_id: @eve_1.id)
    @a_m_6 = AstronautMission.create!(astronaut_id: @joe.id, mission_id: @exon_retreat.id)
    @a_m_7 = AstronautMission.create!(astronaut_id: @joe.id, mission_id: @mars_10.id)
    @a_m_8 = AstronautMission.create!(astronaut_id: @joe.id, mission_id: @zlorg.id)
    @a_m_9 = AstronautMission.create!(astronaut_id: @larry.id, mission_id: @mars_10.id)
    @a_m_10 = AstronautMission.create!(astronaut_id: @larry.id, mission_id: @zlorg.id)

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
  it "I see the average age of all astronauts" do
    visit '/astronauts'

    expect(page).to have_content("Average Age: 32")
  end

  it "I see a list of the space missions' in alphabetical order for each astronaut." do
    visit '/astronauts'

    within "#space-#{@moe.id}" do
      expect(page).to have_content("Missions Served")
      expect(page).to have_content("Eve 1")
      expect(page).to have_content("Exon Annual Space Retreat 15")
      expect(page).to have_content("Mars 10")
      expect(page).to have_content("Zlorg")
    end
  end

  # (e.g "Apollo 13"
  #      "Capricorn 4"
  #      "Gemini 7")


end
