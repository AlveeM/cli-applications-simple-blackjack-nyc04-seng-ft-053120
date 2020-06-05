def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(total)
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

def initial_round
  total = deal_card() + deal_card()
  display_card_total(total)
  return total
end

def hit?(total)
  prompt_user()
  input = get_user_input()
  
  if input == "h"
    total += deal_card()
  end
  
  if input != "h" && input != "s"
    invalid_command()
    prompt_user()
    # tests don't pass without the next line
    input = get_user_input()
  end
  
  return total
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome()
  hand = initial_round()
  
  while hand <= 21
    hand = hit?(hand)
    display_card_total(hand)
  end

  end_game(hand)
end
    
