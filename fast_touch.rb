require 'ruby2d'

set background: 'black'
set width: 800, height: 600
set title: "Fast Touch"

message = Text.new("Lets Start !!!", x:350, y:20)
game_started = false
square = nil
start_time = nil
duration = nil


on :mouse_down do |event|
  if game_started
    if square.contains?(event.x, event.y)
      duration = ((Time.now - start_time)*1000).round
      message = Text.new("You took: #{duration} miliseconds. Go Again ?", x:220, y:20)
      square.remove
      game_started = false

    end
  else
    message.remove

    square = Square.new(
      x: rand(get(:width) -25), y: rand(get(:height) -25),
      size: rand(20..50),
      color: 'red',
    )

    start_time = Time.now
    game_started = true
    end
  end
show
