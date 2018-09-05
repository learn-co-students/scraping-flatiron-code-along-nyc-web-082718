require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  attr_accessor :url

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    # Nokogiri::HTML(open(@url))
  end

  def get_courses
    get_page.css(".post")
  end

  def make_courses
    get_courses.each do |course_xml|
      c = Course.new
      c.title = course_xml.css("h2").text
      c.schedule = course_xml.css(".date").text
      c.description = course_xml.css("p").text
    end
  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
