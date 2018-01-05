require 'rails_helper'

feature 'Home', type: :system do
  scenario 'ゲームを開始する' do
    visit root_path
    expect(page).to have_content 'ゲームを開始'

    click_button 'ゲームを開始'

    player = Player.last

    expect(page).to have_content 'こんにちは'
    expect(page).to have_content player.name
    expect(page).to have_content '他のプレイヤーを探しています'
  end
end