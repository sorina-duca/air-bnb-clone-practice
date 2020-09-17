require 'rails_helper'

RSpec.describe Boat, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should belong_to(:user) }
  it { should have_many(:reviews) }
  it { should have_one_attached(:photo) }
end
