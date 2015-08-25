feature 'Creating tasks' do

  scenario 'I can create a new tasks if I am signed in' do
    user = create :user
    sign_in(user)
    click_button 'New task'
    expect(current_path).to eq('/tasks/new')
    fill_in 'task', with: 'Wash my hair'
    fill_in 'location', with: 'Home'
    fill_in 'deadline', with: '26/08/2015'
    fill_in 'tags', with: 'Personal Care'
    click_button 'Create Task'
    expect(current_path).to eq('/')
    expect(page).to have_content('Wash my hair')
  end

  xscenario 'I cannot create a new task if not signed in' do
    visit('/')
    expect(page).not_to have_content('New Task')
  end


  xscenario 'I can create a new task' do

  end


end
