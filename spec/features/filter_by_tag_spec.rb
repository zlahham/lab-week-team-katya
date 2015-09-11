feature 'Filtering by tag' do
  before :each do
    user = create :user
    sign_in(user)
    click_button 'New task'
    fill_in 'task', with: 'Wash my hair'
    fill_in 'location', with: 'Home'
    fill_in 'deadline', with: '26/08/2015'
    fill_in 'tags', with: 'Personal'
    click_button 'Create Task'
  end
  scenario 'I can filter my tasks by their tag' do
    user = create :user
    sign_in(user)
    click_button 'New task'
    fill_in 'task', with: 'go to the gym'
    fill_in 'location', with: 'First fitness'
    fill_in 'deadline', with: '26/08/2015'
    fill_in 'tags', with: 'fitness'
    click_button 'Create Task'
    click_link 'fitness'
    expect(page).not_to have_content("Wash my hair")
  end
  
  scenario 'Only my tasks with the tags are displayed' do
    user = create :user
    user_2 = create :user_2

    sign_in(user)
    click_button 'New task'
    fill_in 'task', with: 'go to the gym'
    fill_in 'location', with: 'First fitness'
    fill_in 'deadline', with: '26/08/2015'
    fill_in 'tags', with: 'fitness'
    click_button 'Create Task'
    click_button 'Sign out'
    sign_in(user_2)
    click_button 'New task'
    fill_in 'task', with: 'go for a jog'
    fill_in 'location', with: 'Park'
    fill_in 'deadline', with: '27/08/2015'
    fill_in 'tags', with: 'fitness'
    click_button 'Create Task'
    click_link('fitness')
    expect(page).not_to have_content('go to the gym')
  end
end
