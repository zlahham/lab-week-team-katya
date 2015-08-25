feature 'Creating tasks' do

  scenario 'I can create a new tasks if I am signed in' do
    visit('/')
    click_button 'New Task'
    expect(path).to be('/tasks/new')
    fill_in 'task', with: 'Wash my hair'
    fill_in 'location', with: 'Home'
    fill_in 'due date', with: '26/08/2015'
    fill_in 'tag', with: 'Personal Care'
    click_button 'Create Task'
    expect(path).to be('/')
    expect(page).to have_content('Wash my hair')
  end

  xscenario 'I cannot create a new task if not signed in' do
    visit('/')
    expect(page).not_to have_content('New Task')
  end


  xscenario 'I can create a new task' do

  end


end
