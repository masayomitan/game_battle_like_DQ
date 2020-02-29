module MessageDialog
  def attack_message(**params)
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃"
    puts "急所に当たった！" if attack_type == "special_attack"
    
  end

  def damage_message(**params)
    damage = params[:damage]
    target = params[:target]

    puts <<~EOS

    #{target.name}は#{damage}のダメージを受けた
    #{target.name}の残りHPは#{target.hp}だ

    EOS
  end

  def end_message(result)
    if result[:brave_win_flag]
      puts <<~EOS

      勇者は勝った
      #{result[:exp]}の経験値と#{result[:gold]}のゴールドを手に入れた

      EOS
    else
      puts <<~EOS

      勇者はまけた
      目の前が真っ暗になった

      EOS
    end
  end

  def change_message(**params)
    origin_name = params[:origin_name]
    transform_name = params[:change_name]

    puts  "#{origin_name}は怒っている、、、#{origin_name}は#{transform_name}に変身した！"
  end
  
end
