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

def selectchat(db)
	#TODO: Groupchat以外にも対応
	chats = db.execute("SELECT conv_dbid, topic FROM Chats WHERE type = 4")

	puts "List of group chats saved:\nChat ID Title"

	chats.each { |conv_dbid, topic|
		if topic == nil
			topic = "(No title)"
		end
		puts sprintf("% #{7}d", conv_dbid) + " " + topic
	}

	print "\n解析する対象の id を入力してください: "
	convo_id = STDIN.gets.to_i

	# check existence of convo_id
	sql = "SELECT id FROM Chats WHERE conv_dbid = ?"
	if db.execute(sql, convo_id).size == 0
		puts "No such chat with ID: #{convo_id} ."
		abort
	end

	return convo_id
end
