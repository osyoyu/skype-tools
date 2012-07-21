# encoding: UTF-8

require './database.rb'

if ARGV[0] == nil
	dbname = "main.db"
else
	dbname = ARGV[0]
end

db = opendb(dbname)

chats = db.execute("SELECT conv_dbid, topic FROM Chats WHERE type = 4")

puts "List of group chats saved in #{dbname}:\nChat ID Title"

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
end

sql = "SELECT author, COUNT(*) FROM Messages WHERE convo_id = ? GROUP BY author ORDER BY COUNT(*) DESC;"

db.execute(sql, convo_id).each { |skypename, count|
	puts "#{count} 発言 : #{skypename}"
}
