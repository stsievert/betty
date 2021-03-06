module Fun
  def self.interpret(command)
    responses = []
    
    if command.match(/^what\'?s?(\s+is)?\s+the\s+meaning\s+of\s+life\??$/i)
      responses << {
        :say => "42."
      }
    end
    
    if command.match(/^make\s+me\s+a\s+(.+)$/i)
      responses << {
        :say => "Make your own damn #{ $1 }.",
      }
    end
    
    if command.match(/^sudo\s+make\s+me\s+a\s+(.+)$/i)
      responses << {
        :say => "Ha, like sudo has any effect on me!"
      }
    end
    
    if command.match(/^what\'?s?(\s+is)?\s+my\s(mother\s+fucking?)\s+name\??$/i)
      responses << {
        :say => "Snoop Doggy Dogg."
      }
    end
    
    if command.match(/^you\'?(re)?\s+(are\s+)?(cool|awesome|amazing|fun(ny)?|rock\s+my\s+world|rule)$/i)
      responses << {
        :say => "You betcha."
      }
    end
    
    if command.match(/^go\s+crazy$/i) || command.match(/^trip\s+(out|acid)$/i)
      responses << {
        :call => lambda { self.go_crazy },
        :say => "Woah."
      }
    end
    
    responses
  end
  
  def self.go_crazy
    (0...63).step(3) do |i|
      system "osascript -e \"tell application \\\"Terminal\\\" to set background color of window 1 to {64000,#{ 64 - i }000,63000,0}\""
    end

    (0...63).step(3) do |i|
      system "osascript -e \"tell application \\\"Terminal\\\" to set background color of window 1 to {#{ 64 - i }000,#{ i }000,63000,0}\""
    end

    (0...63).step(3) do |i|
      system "osascript -e \"tell application \\\"Terminal\\\" to set background color of window 1 to {#{ i }000,63000,#{ 63 - i }000,0}\""
    end
    
    system 'osascript -e "tell application \"Terminal\" to set background color of window 1 to {64000,64000,64000,0}"'
  end
end

$executors << Fun
