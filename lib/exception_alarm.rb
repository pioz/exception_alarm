require 'exception_alarm/version'
require 'exception_alarm/mpg123'

module ExceptionAlarmInclusion

  def alarm(&block)
    begin
      block.call
    rescue => e
      mpg123_command = find_executable0 ExceptionAlarm::PLAY_COMMAND
      if mpg123_command
        Thread.new do
          `#{mpg123_command} '#{File.expand_path('../alarm.mp3', __FILE__)}' &> '#{File::NULL}'`
        end
      else
        $stderr.puts ExceptionAlarm.mpg123_not_found
      end
      e.backtrace.select!{|b| !b.include?(__FILE__)}
      raise e
    end
  end

end

include ExceptionAlarmInclusion
