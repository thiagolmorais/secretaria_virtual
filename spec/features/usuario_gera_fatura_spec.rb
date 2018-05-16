require 'rails_helper'

feature 'Usuario gera fatura' do
  scenario 'Sucesso' do
    user = create(:user)
    paciente = create(:paciente, nome: 'Paciente A',
                                 email: 'paciente.a@email.com', status: true)
    create(:preco, paciente_id: paciente.id)
    create(:consulta, paciente_id: paciente.id, data: '2018-04-29 19:00:00',
                      hora: '2018-04-29 19:00:00', status: false)

    login_as(user)
    visit consultas_agenda_path
    click_on 'Atender'

    expect(page).to have_content('29/04/2018')
    expect(page).to have_content('19:00')
    expect(page).to have_content('Paciente A')
    expect(page).to have_content('Atendido')
    expect(page).to have_button('Cancelar Fatura')
  end

  scenario 'Paciente sem preço cadastrado' do
    user = create(:user)
    paciente = create(:paciente, nome: 'Paciente A',
                                 email: 'paciente.a@email.com', status: true)
    create(:consulta, paciente_id: paciente.id, data: '2018-04-29 19:00:00',
                      hora: '2018-04-29 19:00:00', status: false)

    login_as(user)
    visit consultas_agenda_path
    click_on 'Atender'

    expect(page).to have_content('Não foi possível efetuar o atendimento, porque o paciente não possui preço cadastrado. Favor cadastrar um preço.')
  end
end
