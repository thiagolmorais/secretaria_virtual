require 'rails_helper'

feature 'User see patient name' do
  scenario 'sucessfuly' do
    user = create(:user)
    patient = create(:patient)

    login_as(user)
    visit root_path
    click_on 'Pacientes'

    expect(page).to have_link(patient.name)
  end
end
