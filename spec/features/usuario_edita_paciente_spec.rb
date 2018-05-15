require 'rails_helper'

feature 'Usuario edita paciente' do
  scenario 'Sucesso' do
    user = create(:user)
    paciente = create(:paciente)

    login_as(user)
    visit edit_paciente_path(paciente)
    fill_in 'Email', with: 'paciente.a2@email.com'
    fill_in 'Telefone', with: '888888888'
    select 'Inativo', from: 'Status'
    select '25', from: 'Dia vencimento'
    fill_in 'Observacao', with: 'Paciente de teste edição'
    click_on 'Gravar'

    expect(page).to have_content('Paciente editado com sucesso!')
    expect(page).to have_content('Paciente A')
    expect(page).to have_content('paciente.a2@email.com')
    expect(page).to have_content('888888888')
    expect(page).to have_content('Feminino')
    expect(page).to have_content('01/01/2000')
    expect(page).to have_content('18/01/2017')
    expect(page).to have_content('Inativo')
    expect(page).to have_content('25')
    expect(page).to have_content('Paciente de teste edição')
  end

  scenario 'Erro por campos em branco' do
    user = create(:user)
    paciente = create(:paciente)

    login_as(user)
    visit edit_paciente_path(paciente)
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
