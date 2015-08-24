feature 'Signing up' do
  
  scenario 'I can sign up as a new user' do
    user = build :user
    expect{ sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Raph')
    expect(User.first.email).to eq('raph@test.com')
  end
  
end