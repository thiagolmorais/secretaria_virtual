require 'rails_helper'

feature 'Usuario visualiza lista de consultas' do
  scenario 'Sucesso' do
    user = create(:user)
    paciente_a = create(:paciente, nome: 'Paciente A',
                                   email: 'paciente.a@email.com', status: true)
    paciente_b = create(:paciente, nome: 'Paciente B',
                                   email: 'paciente.b@email.com', status: false)
    consulta_p_a = create(:consulta, paciente_id: paciente_a.id,
                                     data: '2018-04-29 19:00:00',
                                     hora_inicial: '2018-04-29 19:00:00', status: false)
    consulta_p_b = create(:consulta, paciente_id: paciente_b.id,
                                     data: '2018-04-30 21:00:00',
                                     hora_inicial: '2018-04-30 21:00:00', status: false)

    login_as(user)
    visit consultas_agenda_path

    expect(page).to have_content('29/04/2018')
    expect(page).to have_content('19:00')
    expect(page).to have_content('Paciente A')
    expect(page).to have_content('Agendado')
    expect(page).to have_button('Atender')
    expect(page).to have_content('30/04/2018')
    expect(page).to have_content('21:00')
    expect(page).to have_content('Paciente B')
  end
end
