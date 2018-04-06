require 'rails_helper'

feature 'User see patient name' do
  scenario 'sucessfuly' do
    pending
    user = create(:user)
    patient = create(:patient)

    login_as(user)
    visit root_path
    click_on 'Pacientes'
    click_on patient.name

    expect(page).to have_content(patient.name)
    expect(page).to have_content(patient.phone)
    expect(page).to have_content(patient.birthday)
    expect(page).to have_content(patient.since)
  end
end
