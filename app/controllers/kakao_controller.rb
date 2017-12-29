class KakaoController < ApplicationController
  def keyboard
    home_keyboard = {
      :type => "text"
    }

    render json: home_keyboard
  end

  def message

    # 사용자가 보내준 텍스트를 그대로 다시 말하기

    user_message = params[:content]

    # 로또

    # 메뉴

    # 다른 명령어가 들어왔을 때
    # => ㅠㅠ 알 수 없는 명령어 입니다.

    return_message = {
      :message => {
        :text => user_message
        if user_message == "로또"
          :text => 1..45.sample(6).sort
        elsif user_message == "메뉴"
          menu = ["20층", "국수", "고기"]
          :text => menu.sample(1)
        else
          :text => "nothing"
      }
    }


    render json: return_message
  end
end
