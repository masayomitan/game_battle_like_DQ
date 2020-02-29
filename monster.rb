require './character'

class Monster < Character
  
  DRAGON_ATTACK_CONSTANT = 1.5
  CALC_HALF_UP = 0.5

  def initialize(**params)
    
    super(
    name: params[:name],
    hp: params[:hp],
    offense: params[:offense],
    defense: params[:defense],
    )

    @change = false
    @power_up = params[:hp] * CALC_HALF_UP # 定数を使用
  end

  def attack(brave)

    if @hp <= @power_up && @change == false # HPが半分以下、かつ、モンスター変身判定フラグがfalseの時に実行
      @change = true                        # モンスター変身判定フラグにtrueを代入
      change                                # 変身メソッドを実行
    end

     damage = calculate_damage(brave)            # ダメージ計算処理の呼び出し
     cause_damage(target: brave, damage: damage) # ダメージ反映処理の呼び出し

     attack_message
     damage_message(target: brave, damage: damage)

  end

  private

  def calculate_damage(target)
    @offense - target.defense 
  end

  def cause_damage(**params)
    
    damage = params[:damage] # 引数で受け取った値を変数に格納
    target = params[:target]
    
    target.hp -= damage

    target.hp = 0 if target.hp <= 0

  end


  def change(**params) # 変身メソッドの定義

    change_name = "ドラゴン"
    change_message(origin_name: @name, change_name: change_name)

    @offense *= DRAGON_ATTACK_CONSTANT
    @name = change_name
  end
  

end

 