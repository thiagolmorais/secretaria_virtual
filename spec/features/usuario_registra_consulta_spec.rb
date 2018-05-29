require 'rails_helper'

feature 'Usuario registra consulta' do
  scenario 'Sucesso' do
    user = create(:user)
    paciente = create(:paciente)

    login_as(user)
    visit root_path
    click_on 'Consulta'
    within('div.sidenav') do
      click_on 'Cadastrar Consulta'
    end
    select paciente.nome, from: 'Paciente'
    fill_in 'Data', with: '2018-04-29'
    fill_in 'Hora', with: '2018-04-29 19:18:29'
    click_on 'Gravar'

    expect(page).to have_content('Consulta cadastrada com sucesso!')
    expect(page).to have_content('29/04/2018')
    expect(page).to have_content('19:18')
  end

  scenario 'Erro por campos em branco' do
    pending
    user = create(:user)
    paciente = create(:paciente)

    login_as(user)
    visit root_path
    click_on 'Consulta'
    within('div.sidenav') do
      click_on 'Cadastrar Consulta'
    end
    select paciente.nome, from: 'Paciente'
    fill_in 'Data', with: ''
    fill_in 'Hora', with: '2018-04-29 19:18:29'
    click_on 'Gravar'

    expect(page).to have_content('Data não pode ficar em branco')
    expect(page).to have_content('Hora inicial não pode ficar em branco')
  end
end
