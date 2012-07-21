# encoding: UTF-8

require './database.rb'

if ARGV[0] == nil
	dbname = "main.db"
else
	dbname = ARGV[0]
end

db = opendb(dbname)
convo_id = selectchat(db).to_s

print "検索クエリを入力してください(正規表現が利用できます): "
query = Regexp.new(STDIN.gets.force_encoding("UTF-8").chomp!)

sql = "SELECT author, body_xml, timestamp FROM Messages WHERE convo_id = ?;"

db.execute(sql, convo_id).each { |skypename, body, timestamp|
	if query.match(body)
		puts "[#{Time.at(timestamp).localtime}] #{skypename}: #{body}"
	end
}
