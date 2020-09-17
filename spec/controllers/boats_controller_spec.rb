require 'rails_helper'

RSpec.describe BoatsController, type: :controller do
  it "shows all boats" do
    get 'index'
    expect(response).to be_successful
  end
end
