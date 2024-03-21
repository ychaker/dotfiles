require "irb/competion"

IRB.conf[:SAVE_HISTORY] = 1_000
IRB.conf[:AUTO_INDENT] = true

# Adds the ruby version before the original prompt base
# Example:
# 3.3.0 irb(main):001:0
prompt_base = "#{RUBY_VERSION} %N(%m):%03n:%i"

IRB.conf[:PROMPT][:YBC]= {
  :PROMPT_I => "#{prompt_base}> ",
  :PROMPT_N => "#{prompt_base}> ",
  :PROMPT_S => "#{prompt_base}%l ",
  :PROMPT_C => "#{prompt_base}* ",
  :RETURN   => "=> %s\n",
}

IRB.conf[:PROMPT_MODE] = :YBC

module MyIRBUtils
  def clear
    system('clear') || system('cls')
  end

  def reload!
    load $0
  end
end

include MyIRBUtils
