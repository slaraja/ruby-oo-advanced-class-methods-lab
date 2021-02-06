class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    s = self.new
    s.save
    s
  end 

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
    @@all.detect{|s| s.name == name}
  end 

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical()
    @@all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename) 
    data = filename.split(" - ")
    artist = data[0]
    song_name = data[1].split(".")[0]
    song = self.new 
    song.name = song_name 
    song.artist_name = artist
    song 
  end
  
  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end 

  def self.destroy_all()
    @@all.clear
  end

  end
