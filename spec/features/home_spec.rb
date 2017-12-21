require 'rails_helper'

feature 'Home' do
  scenario 'visit root' do
    visit root_path
    expect(page).to have_content 'Hello world!'
  end
end