require 'tty-prompt'

prompt = TTY::Prompt.new
q1 = 'What is the capital of Scotland?'
q1c = %w(Edinburgh Glasgow Dundee Aberdeen)
q1a = prompt.select(q1, q1c)
p 'CORRECT!' if q1a == q1c[0]
