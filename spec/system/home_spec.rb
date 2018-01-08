require 'rails_helper'

feature 'Home', type: :system do
  scenario 'ゲームを開始する' do
    visit root_path
    expect(page).to have_content 'ゲームを開始'

    click_button 'ゲームを開始'

    yamada = Player.last

    expect(page).to have_content 'こんにちは'
    expect(page).to have_content '他のプレイヤーを探しています'
    expect(page).to have_content yamada.name

    tanaka = create(:player, name: 'Tanaka', room: yamada.room)
    suzuki = create(:player, name: 'Suzuki', room: yamada.room)

    visit rooms_path

    expect(page).to have_content tanaka.name
    expect(page).to have_content suzuki.name
  end
end