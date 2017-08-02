require 'mkmf'
require 'os'

module ExceptionAlarm

  PLAY_COMMAND = 'mpg123'

  def self.mpg123_not_found
    m = "exception_alarm warning: #{PLAY_COMMAND} command not found! #{PLAY_COMMAND} is required to play the mp3 alarm file."
    ic = self.mpg123_install_command
    m += " Please install #{PLAY_COMMAND} with '#{ic}'" if ic
    return m
  end

  def self.mpg123_install_command
    return "brew install #{PLAY_COMMAND}" if OS.osx?
    return "apt-get install #{PLAY_COMMAND}" if OS.linux?
    return nil
  end

end
