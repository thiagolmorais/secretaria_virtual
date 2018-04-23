require 'rails_helper'

feature 'User see patient name' do
  scenario 'sucessfuly' do
    user = create(:user)
    paciente = create(:paciente)

    login_as(user)
    visit root_path
    click_on 'Pacientes'
    click_on paciente.nome

    expect(page).to have_content(paciente.nome)
    expect(page).to have_content(paciente.telefone)
    expect(page).to have_content(paciente.nascimento)
    expect(page).to have_content(paciente.observacao)
    expect(page).to have_content(paciente.email)
    expect(page).to have_content(paciente.nascimento)
    expect(page).to have_content(paciente.paciente_desde)
    expect(page).to have_content('Ativo')
  end
end
