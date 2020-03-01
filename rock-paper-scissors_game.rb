class Player
  def hand
    puts "please select from below"
    puts "0: Rock"
    puts "1: Scissor"
    puts "2: Paper"

    player_number = gets.chomp

    begin
      puts Integer(player_number)
    rescue
      puts "please enter a number"
      player_number = gets.chomp
    end

    while player_number.to_i > 2
      puts "out of boundary chose from below:"
      player_number = gets.to_i
    end
    puts "you chose #{choices(player_number)}"
    player_number
  end

  def choices(player_number)
    if player_number.to_i == 0
      choice = "ROCK"
    elsif player_number.to_i == 1
      choice = "SCISSOR"
    else
      choice = "PAPTER"
    end
    return choice
  end
end

class Enemy
  def hand
    computer_choice = rand(0..2)
    puts " computer chose #{choices(computer_choice)}"
    computer_choice
  end

  def choices(player_number)
    if player_number.to_i == 0
      choice = "ROCK"
    elsif player_number.to_i == 1
      choice = "SCISSOR"
    else
      choice = "PAPTER"
    end
    return choice
  end
end

class Game
  def pon(player_hand, enemy_hand)
    difference = player_hand.to_i - enemy_hand
    final_answer = (difference + 3) % 3
    if final_answer == 2
      puts "You are the winner"
    elsif final_answer == 1
      puts "You are the looser"
    else
      puts "it's a draw. let's try again"
      player = Player.new
      enemy = Enemy.new
      game = Game.new
      game.pon(player.hand, enemy.hand)
    end
  end
end

player = Player.new
enemy = Enemy.new
game = Game.new
game.pon(player.hand, enemy.hand)
