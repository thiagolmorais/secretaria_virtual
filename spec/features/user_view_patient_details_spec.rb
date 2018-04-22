require 'rails_helper'

feature 'User see patient name' do
  scenario 'sucessfuly' do
    pending
    user = create(:user)
    paciente = create(:paciente)

    login_as(user)
    visit root_path
    click_on 'Pacientes'
    click_on paciente.name

    expect(page).to have_content(paciente.name)
    expect(page).to have_content(paciente.phone)
    expect(page).to have_content(paciente.birthday)
    expect(page).to have_content(paciente.since)
  end
end
