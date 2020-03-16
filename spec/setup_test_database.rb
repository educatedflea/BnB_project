require 'pg'
## !! this is only set up for table 'room' at the moment
def setup_test_database
  connection = PG.connect(dbname: 'bnb_test')
  connection.exec("TRUNCATE rooms;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO rooms (name) values ('This is a test room');")
end