# Marc DiFilippo - 111420881
# ISE 337 HW2 Part 3

class Console
  def initialize(player, narrator)
    @player   = player
    @narrator = narrator
  end

  def show_room_description
    @narrator.say "-----------------------------------------"
    @narrator.say "You are in room #{@player.room.number}."

    @player.explore_room

    @narrator.say "Exits go to: #{@player.room.exits.join(', ')}"
  end

  def ask_player_to_act
    actions = {"m" => :move, "s" => :shoot, "i" => :inspect }

    accepting_player_input do |command, room_number|
      @player.act(actions[command], @player.room.neighbor(room_number))
    end
  end

  private

  def accepting_player_input
    @narrator.say "-----------------------------------------"
    command = @narrator.ask("What do you want to do? (m)ove or (s)hoot?")

    unless ["m","s"].include?(command)
      @narrator.say "INVALID ACTION! TRY AGAIN!"
      return
    end

    dest = @narrator.ask("Where?").to_i

    unless @player.room.exits.include?(dest)
      @narrator.say "THERE IS NO PATH TO THAT ROOM! TRY AGAIN!"
      return
    end

    yield(command, dest)
  end
end

class Narrator
  def say(message)
    $stdout.puts message
  end

  def ask(question)
    print "#{question} "
    $stdin.gets.chomp
  end

  def tell_story
    yield until finished?

    say "-----------------------------------------"
    describe_ending
  end

  def finish_story(message)
    @ending_message = message
  end

  def finished?
    !!@ending_message
  end

  def describe_ending
    say @ending_message
  end
end

## MY CODE

class Room
  def initialize(number)
      @number = number
      @hazards = []

      @neighbors = []
  end

  def empty?()
      empty = true
      @hazards.each do |x|
          if x != nil
              empty = false
              break
          end
      end
      empty
  end

  def has?(hazard)
      has = false
      @hazards.each do |x|
          if x == hazard
              has = true
              break
          end
      end
      has
  end

  def add(hazard)
      @hazards[@hazards.size] = hazard
  end

  def remove(hazard)
      i = -1
      @hazards.each do |x|
          i = i + 1
          if x == hazard
              break
          end
      end
      if i != -1
          @hazards[i] = nil
      end
  end

  def connect(room, first = true)
      if @neighbors.size < 3
          @neighbors[@neighbors.size] = room
          if first
              room.connect(self, false)
          end
      end
  end

  def neighbor(number)
      nbr = nil
      @neighbors.each do |x|
          if x.number == number
              nbr = x
              break
          end
      end
      nbr
  end

  def random_neighbor()
      @neighbors.sample()
  end

  def exits()
      exits = []
      i = 0
      @neighbors.each do |x|
          exits[i] = x.number
          i = i + 1
      end
      exits
  end

  def safe?()
      # if it and no neighbors have hazards
      safe = have_hazards
      @neighbors.each do |x|
          if !x.have_hazards
              safe = false
              break
          end
      end
      safe
  end

  def have_hazards()
      safe = true
      @hazards.each do |x|
          if x != nil
              safe = false
              break
          end
      end
      safe
  end

  attr_reader :number, :neighbors, :hazards
end
class Cave
  def initialize()
      @rooms = []
  end

  def add_room(num)
      room = Room.new(num)
      @rooms[num-1] = room
      room
  end

  def print_hazards()
    @rooms.each do |room|
      room.hazards.each do |hzd|
        puts "#{hzd} in #{room.number}!"
      end
    end
  end

  def self.dodecahedron()
      cave = Cave.new
      one = cave.add_room(1)
      two = cave.add_room(2)
      thr = cave.add_room(3)
      fur = cave.add_room(4)
      fiv = cave.add_room(5)
      six = cave.add_room(6)
      svn = cave.add_room(7)
      ate = cave.add_room(8)
      nin = cave.add_room(9)
      ten = cave.add_room(10)
      lvn = cave.add_room(11)
      tlv = cave.add_room(12)
      ttn = cave.add_room(13)
      ftn = cave.add_room(14)
      vtn = cave.add_room(15)
      stn = cave.add_room(16)
      svt = cave.add_room(17)
      atn = cave.add_room(18)
      ntn = cave.add_room(19)
      nty = cave.add_room(20)

      #1
      one.connect(two)
      one.connect(fiv)
      one.connect(ate)
      
      #2
      two.connect(thr)
      two.connect(ten)

      #3
      thr.connect(fur)
      thr.connect(tlv)

      #4
      fur.connect(fiv)
      fur.connect(ftn)

      #5
      fiv.connect(six)

      #6
      six.connect(svn)
      six.connect(vtn)

      #7
      svn.connect(ate)
      svn.connect(svt)

      #8
      ate.connect(lvn)

      #9
      nin.connect(ten)
      nin.connect(tlv)
      nin.connect(ntn)

      #10
      ten.connect(lvn)

      #11
      lvn.connect(nty)

      #12
      tlv.connect(ttn)

      #13
      ttn.connect(ftn)
      ttn.connect(atn)

      #14
      ftn.connect(vtn)

      #15
      vtn.connect(stn)

      #16
      stn.connect(svt)
      stn.connect(atn)

      #17
      svt.connect(nty)

      #18
      atn.connect(ntn)

      #19
      ntn.connect(nty)

      cave
  end

  def room(num)
      @rooms[num-1]
  end

  def random_room()
      @rooms.sample()
  end

  def move(hazard, from_room, to_room)
      if from_room.has?(hazard)
          from_room.remove(hazard)
          to_room.add(hazard)
      end
  end

  def add_hazard(hazard, count)
      rand = @rooms.sample(count)
      rand.each do |x|
          if !(x.has?(hazard))
              x.add(hazard)
          end
      end
  end

  def room_with(hazard)
      room = nil
      @rooms.each do |x|
          if x.has?(hazard)
              room = x
              break
          end
      end
      room
  end

  def entrance()
      entrance = nil
      @rooms.each do |x|
          if x.safe?
              entrance = x
          end
      end
      entrance
  end
end

class Player
  def initialize()
    @senses = Hash.new
    @encounters = Hash.new
    @actions = Hash.new
    @room = nil
  end

  def sense(hazard, &block)
    @senses[hazard] = block
  end

  def encounter(hazard, &block)
    @encounters[hazard] = block
  end

  def action(action, &block)
    @actions[action] = block
  end

  def enter(room)
    @room = room
    @room.hazards.each do |x|
      enc = @encounters[x]
      if enc != nil
        enc.call
      end
    end
  end

  def explore_room()
    if @room == nil
      return
    end
    @room.neighbors.each do |nbr|
      nbr.hazards.each do |x|
        sense = @senses[x]
        if sense != nil
          sense.call()
        end
      end
    end
  end

  def act(action, room)
    action = @actions[action]
    if action != nil
      action.call(room)
    end
  end

  attr_reader :room
end
