# ExceptionAlarm

This simple gem play an alarm sound when an exception is raised on your Ruby
code.

## Installation

    $ brew install mpg123
    or
    $ apt-get install mpg123

    $ gem install exception_alarm

ExceptionAlarm use the command line program [`mpg123`](https://www.mpg123.de/)
to play mp3 alarm file. So you have to install it on your environment.

## Usage

    require 'exception_alarm'

    alarm do
      # your code...
      raise 'play alarm sound'
    end

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pioz/exception_alarm.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
