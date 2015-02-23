require 'rails_helper'

describe 'Users can CRUD courses' do
  before :each do
    visit '/'
    User.create(user_name: 'Missy', about: 'gSchool Student', password: 'password')
    fill_in 'user_name', with: 'Missy'
    fill_in 'password', with: 'password'
    within('form') do
      click_on 'login'
    end
    @course = Course.create(title: 'Modern Dance', day_night: true)
  end

  scenario 'User can create a course' do
    visit '/courses'
    expect(page).to have_content('Modern Dance')
  end

  scenario 'User can view course show page' do
    visit "/courses/#{@course.id}"
    expect(page).to have_content('Modern Dance')
  end

  scenario 'User can edit a course' do
    visit "/courses/#{@course.id}/edit"
    fill_in 'course[title]', with: 'Econ 101'
    click_on 'Update Course'
    expect(page).to have_content('Econ 101')
  end

  scenario 'User can delete a course' do
    visit "/courses/#{@course.id}"
    click_on 'Delete'
    expect(page).to have_no_content('Modern Dance')
  end


end
