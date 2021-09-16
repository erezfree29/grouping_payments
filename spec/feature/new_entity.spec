require 'rails_helper'
RSpec.describe 'Create internal transaction proccess', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'Create group' do
    user1 = User.create(name: 'Erez', email: 'erezfree29@gmail.com', password: 'Newblue29*')
    visit root_path
    click_link_or_button 'Sign_in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: 'Newblue29*'
    click_button 'Submit'
    click_link_or_button 'add a merchant'
    fill_in 'group[name]', with: 'burger king'
    attach_file('group[icon]', "#{Rails.root}/spec/images/download.png")
    click_button 'commit'
    expect(page).to have_text('group created!')
  end

  it 'Transaction' do
    user1 = User.create(name: 'Erez', email: 'erezfree29@gmail.com', password: 'Newblue29*')
    visit root_path
    click_link_or_button 'Sign_in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: 'Newblue29*'
    click_button 'Submit'
    click_link_or_button 'add a merchant'
    fill_in 'group[name]', with: 'burger king'
    attach_file('group[icon]', "#{Rails.root}/spec/images/download.png")
    click_button 'commit'
    click_button 'submit transaction'
    fill_in 'entity[name]', with: 'burger'
    fill_in 'entity[occured]', with: Time.now
    fill_in 'entity[amount]', with: 2.0
    click_button 'commit'
    expect(page).to have_text('entity created!')
  end
end
