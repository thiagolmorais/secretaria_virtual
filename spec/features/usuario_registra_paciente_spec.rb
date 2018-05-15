require 'rails_helper'

feature 'Usuario registra paciente' do
  scenario 'Sucesso' do
    user = create(:user)

    login_as(user)
    visit root_path
    click_on 'Paciente'
    within('div.sidenav') do
      click_on 'Cadastrar Paciente'
    end
    fill_in 'Nome', with: 'Paciente A'
    fill_in 'Email', with: 'paciente.a@email.com'
    fill_in 'Telefone', with: '999999999'
    select 'Feminino', from: 'Sexo'
    fill_in 'Nascimento', with: '01/01/2000'
    fill_in 'Paciente desde', with: '18/01/2017'
    select 'Inativo', from: 'Status'
    select '15', from: 'Dia vencimento'
    fill_in 'Observacao', with: 'Paciente de teste'
    click_on 'Gravar'

    expect(page).to have_content('Paciente cadastrado com sucesso!')
    expect(page).to have_content('Paciente A')
    expect(page).to have_content('paciente.a@email.com')
    expect(page).to have_content('999999999')
    expect(page).to have_content('Feminino')
    expect(page).to have_content('01/01/2000')
    expect(page).to have_content('18/01/2017')
    expect(page).to have_content('Inativo')
    expect(page).to have_content('15')
    expect(page).to have_content('Paciente de teste')
  end

  scenario 'Erro por campos em branco' do
    user = create(:user)

    login_as(user)
    visit root_path
    click_on 'Paciente'
    within('div.sidenav') do
      click_on 'Cadastrar Paciente'
    end
    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'Telefone', with: ''
    select 'Masculino', from: 'Sexo'
    fill_in 'Nascimento', with: ''
    fill_in 'Paciente desde', with: ''
    select 'Ativo', from: 'Status'
    select '1', from: 'Dia vencimento'
    fill_in 'Observacao', with: ''
    click_on 'Gravar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Nascimento não pode ficar em branco')
    expect(page).to have_content('Paciente desde não pode ficar em branco')
  end
end
