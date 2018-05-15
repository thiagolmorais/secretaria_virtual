require 'rails_helper'

feature 'Usuario visualiza lista de pacientes' do
  scenario 'Sucesso' do
    user = create(:user)
    paciente_a = create(:paciente, nome: 'Paciente A',
                                   email: 'paciente.a@email.com', status: true)
    paciente_b = create(:paciente, nome: 'Paciente B',
                                   email: 'paciente.b@email.com', status: false)

    login_as(user)
    visit root_path
    click_on 'Paciente'
    within('div.sidenav') do
      click_on 'Consultar Paciente'
    end

    expect(page).to have_content('Paciente A')
    expect(page).to have_content('paciente.a@email.com')
    expect(page).to have_content('Ativo')
    expect(page).to have_content('Paciente B')
    expect(page).to have_content('paciente.b@email.com')
    expect(page).to have_content('Inativo')
    expect(page).not_to have_content('Paciente c')
    expect(page).not_to have_content('paciente.c@email.com')
  end
end
