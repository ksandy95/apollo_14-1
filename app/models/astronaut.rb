class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    Astronaut.average(:age)
  end

  def ordered_list
    a = self.astronaut_missions
    b = a.map do |mission|
          Mission.find(mission.mission_id)
        end
    c = b.map do |title|
          title.title
        end
  end

end
