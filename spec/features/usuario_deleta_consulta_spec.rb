require 'rails_helper'

feature 'Usuario deleta consulta' do
  scenario 'Sucesso' do
    user = create(:user)
    paciente = create(:paciente, nome: 'Paciente A',
                                 email: 'paciente.a@email.com', status: true)
    create(:consulta, paciente_id: paciente.id, data: '2018-04-29 19:00:00',
                      hora: '2018-04-29 19:00:00', status: false)

    login_as(user)
    visit consultas_agenda_path
    click_on 'X'

    expect(page).not_to have_content('29/04/2018')
    expect(page).not_to have_content('19:00')
    expect(page).not_to have_content('Paciente A')
    expect(page).not_to have_content('Agendado')
    expect(page).not_to have_button('Atender')
  end
end
