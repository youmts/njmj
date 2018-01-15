require 'rails_helper'

feature 'Room', type: :system do
  def start_game
    visit root_path
    click_button 'ゲームを開始'
    Player.last # TODO: きちんとする
  end

  scenario '部屋に入る' do
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

  context '部屋に入った後' do
    let(:room) { create(:room) }
    let(:yamada) { start_game }
    let(:tanaka) { create(:player, room: room) }

    let(:other_room) { create(:room) }
    let(:suzuki) { create(:player, room: other_room) }

    before :each do
      room
      yamada
      tanaka
    end

    scenario 'メッセージのやり取りをする' do
      expect(current_path).to eq rooms_path
      expect(page).to have_content 'Say something' # wait to page

      # 自分が送ったメッセージ
      message = 'How are you?'
      find('form input').set message
      find('form input').native.send_keys(:return)

      expect(page).to have_content message, count: 1

      # 他の人が送ったメッセージ
      tanaka_message = create(:message, content: "I'm fine.", room: room, player: tanaka)
      expect(page).to have_content tanaka_message.content, count: 1

      # 他の部屋のメッセージは見えない
      suzuki_message = create(:message, content: "boring.", room: suzuki.room, player: suzuki)
      expect(page).not_to have_content suzuki_message.content
    end
  end
end