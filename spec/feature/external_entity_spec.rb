require 'rails_helper'
RSpec.describe 'Create external transaction proccess', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'Transaction' do
    user1 = User.create(name: 'Erez', email: 'erezfree29@gmail.com', password: 'Newblue29*')
    visit root_path
    click_link_or_button 'Sign_in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: 'Newblue29*'
    click_button 'Submit'
    click_link_or_button 'add a stand alone transaction'
    fill_in 'entity[external_group_name]', with: 'Hot dog stand'
    fill_in 'entity[name]', with: 'Hot dog'
    fill_in 'entity[occured]', with: Time.now
    fill_in 'entity[amount]', with: 2.0
    click_button 'commit'
    expect(page).to have_text('external entity created!')
  end
end
