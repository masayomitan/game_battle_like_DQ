require './character'

class Brave < Character  

  SPECIAL_ATTACK_CONSTANT = 1.5


  def attack(monster)
    # puts "#{@name}の攻撃"

    attack_type = decition_attack_type
    damage = calculate_damage(target: monster, attack_type: attack_type) # calculate_damageメソッドの呼び出し
    cause_damage(target: monster, damage: damage) #ダメージ反映メソッドの呼び出し
   
    attack_message(attack_type: attack_type)
    damage_message(target: monster, damage: damage)
  end

  private
  
  def decition_attack_type #攻撃判定のメソッド
    
    attack_num = rand(4) # 0~3の間でランダムに数字が変わる

    if attack_num == 0
      # puts "急所に当たった！"
      "special_attack"
    else
      "normal_attack"
    end
  end
  
  def calculate_damage(**params) # ダメージの計算メソッド,変数をparamsでうけとる

    target = params[:target]  # 変数に格納することによって将来ハッシュのキーに変更があった場合でも変更箇所が少なくて済む
    attack_type = params[:attack_type]

    if attack_type == "special_attack"
      calculate_special_attack - target.defense
    else
      @offense - target.defense
    end
  end
   
  def cause_damage(**params)
    damage = params[:damage]
    target = params[:target]

    target.hp -= damage

    target.hp = 0 if target.hp <= 0  

  
  end

  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end

end
