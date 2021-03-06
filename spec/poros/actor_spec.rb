require 'rails_helper'

describe Actor do
  before :each do
    @data = {
      adult: false,
      gender: 2,
      id: 2888,
      known_for_department: "Acting",
      name: "Will Smith",
      original_name: "Will Smith",
      popularity: 20.887,
      profile_path: "/eze9FO9VuryXLP0aF2cRqPCcibN.jpg",
      cast_id: 16,
      character: "Capt. Steven Hiller",
      credit_id: "52fe425bc3a36847f8017f8b",
      order: 0
      }
      @actor = Actor.new(@data)
  end

  it 'exists and has attributes' do
    expect(@actor).to be_an Actor
    expect(@actor).to have_attributes(name: @data[:name], character: @data[:character])
  end
end
