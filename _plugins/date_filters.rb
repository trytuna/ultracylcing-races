require 'logger'

module Jekyll
  module RaceFilters
    def self.logger
      @logger ||= Logger.new(STDOUT, level: Logger::DEBUG)
    end

    def upcoming_races(races, months = 3)
      Jekyll::RaceFilters.logger.info "upcoming_races filter called with #{races&.length} races"

      today = Date.today
      future = today >> months
      
      races.select do |race|
        next unless race['start']
          
        race_date = Date.parse(race['start'])
        race_date >= today && race_date <= future
      end.sort_by { |race| Date.parse(race['start']) }
    end
    
    def past_races(races)
      Jekyll::RaceFilters.logger.info "past_races filter called with #{races&.length} races"

      today = Date.today
      
      races.select do |race|
        next unless race['start']
        race_date = Date.parse(race['start'])
        race_date < today
      end.sort_by { |race| Date.parse(race['start']) }.reverse
    end
  end
end

Liquid::Template.register_filter(Jekyll::RaceFilters)
