require 'rails_helper'

feature 'Usuario gera pagamento' do
  scenario 'Sucesso' do
    user = create(:user)
    paciente = create(:paciente, nome: 'Paciente A',
                                 email: 'paciente.a@email.com', status: true)
    create(:preco, paciente_id: paciente.id, valor: '120.75')
    consulta = create(:consulta, paciente_id: paciente.id,
                                 data: '2018-04-29 19:00:00',
                                 hora_inicial: '2018-04-29 19:00:00', status: false)

    login_as(user)
    visit consultas_agenda_path
    click_on 'Atender'
    within('div.sidenav') do
      click_on 'Pagamentos'
    end
    click_on 'Quitar'

    expect(page).to have_content(paciente.nome)
    expect(page).to have_content('20184')
    expect(page).to have_content('120,75')
    expect(page).to have_content('Pago')
    expect(page).to have_link('Estornar pagamento')
    expect(page).not_to have_button('Quitar')
    expect(page).not_to have_content('Em aberto')
  end
end
