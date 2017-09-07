require File.expand_path('../../../config/environment', __FILE__)
require 'ffaker'

namespace :sample_data do
  def sample_object
    user = ::User.create(
      email: FFaker::Internet.email,
      display_name: FFaker::Name.name
    )
    etd = Etd.new
    etd.title = [FFaker::Book.title]
    etd.creator = [user.display_name]
    etd.depositor = user.email
    etd.keyword = [FFaker::Education.major, FFaker::Education.major]
    etd.degree = [FFaker::Education.degree]
    etd.visibility = "open"
    etd.save
    etd
  end

  desc 'Build basic sample data'
  task :build do
    puts 'Making sample data'
    etd = sample_object
    puts etd.inspect
    puts "Created #{etd.id}"
  end
end
