describe 'Valid users can sign in' do

  scenario 'User with valid login credentials can login' do
    User.create(user_name: 'Missy', about: 'gSchool Student', password: 'password')
    visit '/'
    fill_in 'user_name', with: 'Missy'
    fill_in 'password', with: 'password'
    click_on 'login'
    expect(page).to have_content('Missy')
  end

end
