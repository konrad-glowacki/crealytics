require 'date'

class Finder
  class NoMatchingFiles < RuntimeError; end;

  class << self
    def latest(name)
      files = Dir.glob(["#{ ENV["HOME"] }/workspace/*#{name}*.txt"])

      raise NoMatchingFiles if files.empty?

      files.sort_by! do |file|
        last_date = /\d+-\d+-\d+_[[:alpha:]]+\.txt$/.match file
        last_date = last_date.to_s.match /\d+-\d+-\d+/

        date = DateTime.parse(last_date.to_s)
        date
      end

      files.last
    end
  end
end
