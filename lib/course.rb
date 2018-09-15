class Course
  attr_accessor :title, :schedule, :description

  @@all = []

  def initialize(title=nil, schedule=nil, description=nil)
    @title = title
    @schedule = schedule
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end # end class Course
