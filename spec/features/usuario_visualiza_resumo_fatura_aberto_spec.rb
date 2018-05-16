require 'rails_helper'

feature 'Usuario visualiza resumo de faturas em aberto' do
  scenario 'Sucesso' do
    user = create(:user)
    paciente = create(:paciente, nome: 'Paciente A',
                                 email: 'paciente.a@email.com', status: true)
    create(:preco, paciente_id: paciente.id, valor: '120.75')
    create(:consulta, paciente_id: paciente.id, data: '2018-04-29 19:00:00',
                      hora: '2018-04-29 19:00:00', status: false)

    login_as(user)
    visit consultas_agenda_path
    click_on 'Atender'
    within('div.sidenav') do
      click_on 'Faturas'
    end

    expect(page).to have_content(paciente.nome)
    expect(page).to have_content('120,75')
  end
end
