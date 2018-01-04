require 'rails_helper'

feature 'Home', type: :system do
  scenario 'ゲームを開始する' do
    visit root_path
    expect(page).to have_content 'ゲームを開始'

    click_button 'ゲームを開始'

    expect(page).to have_content '他のプレイヤーを探しています'
  end
end