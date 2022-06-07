module Janken
  def janken_start
    puts "最初はグー、ジャンケン.."
    puts "(0)グー(1)チョキ(2)パー(3)戦わない"
    @player = gets.chomp.to_i
    @opponent = rand(3)
    if @player == 3
      puts "goodbye!"
      exit
    end
    puts "ホイ！"
    janken_result
    janken_judge
  end
  
  def janken_aiko
    puts "あいこで"
    puts "(0)グー(1)チョキ(2)パー(3)戦わない"
    @player = gets.chomp.to_i
    @opponent = rand(3)
    puts "しょ！"
    janken_result
    janken_judge
  end
  
  def janken_result
    output = ["グー","チョキ","パー"]
    puts "あなたは#{output[@player]}を出しました"
    puts "相手は#{output[@opponent]}を出しました"
  end
  
  def janken_judge
    judge = @player - @opponent
    if judge == 0
      janken_aiko
    elsif judge == 1 || judge == -2
      puts "あなたの負けです"
      Acchimuite.acchimuite_lose
      
    else 
      puts "あなたの勝ちです"
      Acchimuite.acchimuite_win
    end
  end
  module_function :janken_start
  module_function :janken_aiko
  module_function :janken_result
  module_function :janken_judge
end
module Acchimuite
  def acchimuite_win
    puts "あっち向いてー.."
    puts "(0)上(1)右(2)下(3)左"
    @player = gets.chomp.to_i
    @opponent = rand(4)
    puts "ホイ！"
    acchimuite_result
    judge = (@player === @opponent)
    if  judge == true
      puts "あなたの勝ちです！"
      puts "おめでとう！"
      Janken.janken_start
    else 
      Janken.janken_start
    end
  end
  
  def acchimuite_lose
    puts "あっち向いてー.."
    puts "(0)上(1)右(2)下(3)左"
    @player = gets.chomp.to_i
    @opponent = rand(4)
    puts "ホイ！"
    acchimuite_result
     judge = (@player === @opponent)
    if  judge == true
      puts "あなたの負けです.."
      Janken.janken_start
    else 
      Janken.janken_start
    end
  end
  
  def acchimuite_result
    output = ["上","右","下","左"]
    puts "あなたは#{output[@player]}を出しました"
    puts "相手は#{output[@opponent]}を出しました"
  end
  module_function :acchimuite_win
  module_function :acchimuite_lose
  module_function :acchimuite_result
end

Janken.janken_start

