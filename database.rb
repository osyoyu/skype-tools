# encoding: UTF-8

require 'sqlite3'

def opendb(filename)
	if filename == nil
		puts "missing file operand"
		abort
	elsif !File.exist?(filename)
		puts "#{ARGV[0]}: No such file"
		abort
	end
	return SQLite3::Database.new(filename)
end
