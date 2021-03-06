
# Assignment: Calculator bonus features

require 'yaml'

LANGUAGE = 'es'.freeze

MESSAGES = YAML.load_file('calc_msgs.yml')

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

# def valid_number?(num) <---original validation block
#	num.to_i() != 0
# end


def operation_to_message(op)
  word = case op
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word
end

def integer?(input) # <--initial validation improvemnet
  input.to_i.to_s == input
end

def float?(input) # <---upgraded to process decimals
  input.to_f.to_s == input
end

def number?(input) # <---method invoking both validation methods
  integer?(input) || float?(input)
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets().chomp().to_yaml

  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt(messages('name_greet', LANGUAGE) + ("#{name}!"))

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('input1', LANGUAGE))
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(messages('nope', LANGUAGE))
    end
  end

  number2 = ''
  loop do
    prompt(messages('input2', LANGUAGE))
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(messages('nope', LANGUAGE))
    end
  end

  operator_prompt = <<-MSG
	  What operation would you like to perform?
	  1) add
	  2) subtract
	  3) multiply
	  4) divide
	MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}.")

  prompt(messages('again', LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('thanks', LANGUAGE))
