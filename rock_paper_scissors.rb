

VALID_CHOICES = %w(rock paper scissors lizard spock)
  

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') || # Rubocop complains
    (first == 'rock' && second == 'lizard') || # that this method
    (first == 'paper' && second == 'rock') ||  # ABC size is too
    (first == 'paper' && second == 'spock') || # high, not sure how
    (first == 'scissors' && second == 'paper') || # to adjust.
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lose!")
  else
    prompt("Tie game!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    
    
    prompt("(The first letter will suffice. 'sp' for Spock.)")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("You had one job.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  #
  #   if (choice == 'rock' && computer_choice == 'scissors') ||
  # 		 (choice == 'paper' && computer_choice == 'rock') ||
  # 		 (choice == 'scissors' && computer_choice == 'paper')
  # 	  prompt("You won!")
  # 	elsif (choice == 'rock' && computer_choice == 'paper') ||
  # 	      (choice == 'paper' && computer_choice == 'scissors') ||
  # 	      (choice == 'scissors' && computer_choice == 'paper')
  # 	  prompt("You lose!")
  # 	else
  # 		prompt("Tie game!")
  # 	end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for playing!")

# MY FINDINGS FROM THE 'THINGS TO CONSIDER' SECTION:  #
#
# 1) After rearranging how the methods are stacked towards
#    the beginning of the program, it seemed to have no effect
#    on functionality.

# 2) Calling the test_method after the prompt returns the message
#    right before the initial game prompt. Calling it before the
#    before the prompt method returns an 'undefined method' error
#    for calling the 'prompt' method before writing it.
