$endType = 3

$game1Rand = 3
$game2Rand = 4

$game1Type = ["グー","チョキ","パー"]
$game2Type = ["上","下","左","右"]

#ジャンケン勝敗判定関数
#player:プレイヤーの数値
#npc:NPCの数値
def game1Result(player,npc)
  #あいこ
  if player == npc
    return "draw"
  end
  
  #勝敗
  case player
  when 0,1 then
    temp = npc - player
    if temp == 1
      return "win"
    else 
      return "lose"
    end
  when 2 then
    if npc == 0
      return "win"
    else
      return "lose"
    end
  else
    p "ERROR game1result >> player:" + player.to_s + ", npc:" + npc.to_s
    exit
  end
end

#ジャンケンメイン処理
#draw:あいこフラグ
def game1(draw_flg)
  if draw_flg == false
    p "じゃんけん..."
  else
    p "あいこで..."
  end
  p "0(グー)1(チョキ)2(パー)3(戦わない)"
  player_type = gets.to_i
  
  if player_type == $endType
    p "終了が選択されました"
    exit
  end
  
  p "ホイ！"
  p "------------------------------------"
  p "あなた：" + $game1Type[player_type] + "を出しました"
  
  npc_type = rand($game1Rand)
  
  p "あいて：" + $game1Type[npc_type] + "を出しました"
  p "------------------------------------"
  result = game1Result(player_type,npc_type)
  
  case result
  when "win" then
    p "あなたの勝ち！"
  when "lose" then
    p "あなたの負け！"
  else
    if result != "draw"
      p "ERROR game1 >> result:" + result
      exit
    end
  end
  return result
end

#あっち向いてホイ勝敗判定
#game1res:じゃんけんの勝敗(win or lose)
#player:プレイヤーの数値
#npc:NPCの数値
def game2Result(game1res,player,npc)
  #勝敗
  if player == npc
    return game1res == "win" ? "win" : "lose"
  else
    return game1res == "win" ? "lose" : "win"
  end
end

#あっち向いてホイメイン処理
#game1res:じゃんけんの勝敗(win or lose)
def game2(game1res)
  p "あっち向いて〜"
  p "0(上)1(下)2(左)3(右)"
  player_type = gets.to_i
  
  p "ホイ！"
  p "------------------------------------"
  p "あなた：" + $game2Type[player_type] + "を出しました"
  
  npc_type = rand($game2Rand)
  
  p "あいて：" + $game2Type[npc_type] + "を出しました"
  p "------------------------------------"
  result = game2Result(game1res,player_type,npc_type)
  
  case result
  when "win" then
    p "あなたの勝ち！"
  when "lose" then
    p "あなたの負け！"
  else
    p "ERROR game2 >> result:" + result
    exit
  end
end

#main

#じゃんけんの時に戦わないを選択するまでループ
condition = false
while condition == false do
  draw_flg = false
  end_flg = false
  game1res = nil
  #じゃんけん
  while end_flg == false do
    game1res = game1(draw_flg)
    
    if game1res != "draw"
      end_flg = true
    else
      draw_flg = true
    end
  end
  
  #あっち向いてホイ
  game2(game1res)
end
#main end