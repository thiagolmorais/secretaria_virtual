require 'rails_helper'

feature 'Usuario edita consulta' do
  scenario 'Sucesso' do
    user = create(:user)
    paciente = create(:paciente)
    consulta = create(:consulta, paciente_id: paciente.id)

    login_as(user)
    visit consulta_path(consulta)
    click_on 'Editar'
    select paciente.nome, from: 'Paciente'
    fill_in 'Data', with: '2018-04-30'
    fill_in 'Hora', with: '2018-04-29 18:00:00'
    click_on 'Gravar'

    expect(page).to have_content('Consulta editada com sucesso!')
    expect(page).to have_content('30/04/2018')
    expect(page).to have_content('18:00')
  end

  scenario 'Erro por campos em branco' do
    user = create(:user)
    paciente = create(:paciente)
    consulta = create(:consulta, paciente_id: paciente.id)

    login_as(user)
    visit consulta_path(consulta)
    click_on 'Editar'
    select paciente.nome, from: 'Paciente'
    fill_in 'Data', with: ''
    fill_in 'Hora', with: ''
    click_on 'Gravar'

    expect(page).to have_content('Data não pode ficar em branco')
    expect(page).to have_content('Hora não pode ficar em branco')
  end
end
