# source: https://github.com/jrochkind/formatted_rails_logger/blob/master/lib/formatted_rails_logger/buffered_logger_inject.rb
class ActiveSupport::BufferedLogger
  attr_accessor :formatter
  # use pure ruby class method, Rails provides ones with
  # better semantics for inheritance, but they keep changing
  # version to version, so nope.
  class << self ; attr_accessor :default_formatter ; end

  def initialize(*args)
    super(*args)
    @log.formatter = self.class.default_formatter if self.class.default_formatter
  end

  def formatter=(formatter)
    @log.formatter = formatter
  end

  def formatter
    @log.formatter
  end

end

module ActiveSupport
  # Colourful log Output with Date and Severity Colors
  class ColumnsFormatter < ::Logger::Formatter
    NUMBER_TO_COLOR_MAP = {'DEBUG'=>'0;37', 'INFO'=>'32', 'WARN'=>'33', 'ERROR'=>'31', 'FATAL'=>'31', 'UNKNOWN'=>'37'}

    def initialize
      @datetime_format = '%d.%m.%Y %H:%M:%S.%3N'
      @format_str = "%s\033[0;37m%s\033[0m [\033[%sm%-5s\033[0m] %s\n"
    end

    def call(severity, timestamp, progname, message)
      breaks = message["\n\n"]
      @format_str % [breaks ? "\n" : '', format_datetime(timestamp), NUMBER_TO_COLOR_MAP[severity], severity, msg2str(message.strip)]
    end
  end
end