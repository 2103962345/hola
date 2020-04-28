@break #^
=begin

@echo off
echo BATCH: Hello world!
ruby "%~f0" %*
exit /b 0

=end
puts 'RUBY: Hello world!'