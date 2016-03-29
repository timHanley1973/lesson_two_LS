# Mortgage calcualtor assignment
# Data to be gathered: Loan amount, APR, loan duration.
# Calcualte the monthly interest rate, loan duration in months.

def prompt(message)
  Kernel.puts("~~~~~#{message}")
end

loop do
  welcome_prompt = <<-WP
        $$$$$$$$$$$$$$$$$$$$$$$$$
	    Welcome to Mortgage-o-matic!
	    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	  First off: How much is the loan?
  WP

  prompt(welcome_prompt)

  amount = ''
  loop do
    amount = Kernel.gets().chomp().gsub(/(?<=\d),(?=\d{3})/, '') #<--fix for commas
    if amount.empty?() || amount.to_f() <= 0 
      prompt("I need a positive number, genius.")
    else
      break
    end
  end

  prompt("What is your interest rate? (Example: 4.5 for 4.5%)")
  

  interest_rate = ''
  loop do
    interest_rate = Kernel.gets().chomp()

    if interest_rate.empty?() || interest_rate.to_f() <= 0
      prompt("Cute. How about a positive number?")
    else
      break
    end
  end

  prompt("What is the duration of the loan? (in years)")

  years = ''
  loop do
    years = Kernel.gets().chomp()

    if years.empty?() || years.to_i() <= 0
      prompt("Positive numbers are what I need.")
    elseate
      break
    end
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i() * 12


  monthly_payment = amount.to_f() *
                    (monthly_interest_rate * (1 + monthly_interest_rate)**-months.to_i()) /
                    (1 - (1 + monthly_interest_rate)**-months.to_i())

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  prompt("Would you like to do another calculation?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using Mortgage-o-matic!")
prompt("Bye!")
