
class GamesController
  include MessageDialog

  EXP_CONSTANT = 2
  GOLD_CONSTANT = 3

  
  def battle(**params)
    
    build_characters(params)
    
      loop do #ループメソッド
        @brave.attack(@monster) 
        break if battle_end?
        @monster.attack(@brave)
        break if battle_end?
      end

    battle_judgement
  end


  def build_characters(**params) # キャラクターのインスタンスをインスタンス変数に格納
    @brave = params[:brave]
    @monster = params[:monster]
  end

  def battle_end? # バトル終了の判定
    @brave.hp <= 0 || @monster.hp <= 0
  end
  
  def brave_win? # 勇者の勝利判定
    @brave.hp > 0
  end

  def battle_judgement
    result = calculate_of_exp_and_gold
    
    end_message(result)
  end

  def calculate_of_exp_and_gold
    if brave_win?
      brave_win_flag = true
      exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
      gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
    else
      brave_win_flag = false
      exp = 0
      gold = 0
    end
    {brave_win_flag: brave_win_flag, exp: exp, gold: gold}
  end

  # while true 

  #   puts 'スライムが現れた！'
  #   puts '攻撃してください'
  #   puts'戦う [1]  逃げる [2]'
  #   input = gets.to_i
  
  #   if input == 1
  #     battle(**params)
  #   elsif input == 2
  #     exit
  #   end
  # end  

end


