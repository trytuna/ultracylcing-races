require 'logger'

module Jekyll
  module RaceFilters
    def self.logger
      @logger ||= Logger.new(STDOUT, level: Logger::DEBUG)
    end

    def parse_date_safe(date_string)
      return nil if date_string.nil? || date_string.empty?
      
      begin
        Date.parse(date_string)
      rescue ArgumentError, TypeError
        nil
      end
    end

    def upcoming_races(races, months = 3)
      Jekyll::RaceFilters.logger.info "upcoming_races filter called with #{races&.length} races"

      today = Date.today
      future = today >> months
      
      races_with_dates = races.select do |race|
        next unless race['start']
        
        start_date = parse_date_safe(race['start'])
        next unless start_date
        
        end_date = race['end'] ? parse_date_safe(race['end']) : start_date
        next unless end_date
        
        end_date >= today && start_date <= future
      end.sort_by { |race| parse_date_safe(race['start']) }
      
      races_without_dates = races.select do |race|
        race['start'] && parse_date_safe(race['start']).nil?
      end
      
      races_with_dates + races_without_dates
    end
    
    def past_races(races)
      Jekyll::RaceFilters.logger.info "past_races filter called with #{races&.length} races"

      today = Date.today
      
      races.select do |race|
        next unless race['start']
        
        date_field = race['end'] || race['start']
        race_date = parse_date_safe(date_field)
        next unless race_date
        
        race_date < today
      end.sort_by do |race|
        date_field = race['end'] || race['start']
        parse_date_safe(date_field)
      end.reverse
    end
  end
end

Liquid::Template.register_filter(Jekyll::RaceFilters)
