ActiveRecord::Base.establish_connection("sqlite3:db/development.db")

class History < ActiveRecord::Base

end

class Unit < ActiveRecord::Base
    
end