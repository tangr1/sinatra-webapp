class User
    include DataMapper::Resource
    property :id, Serial
    property :email, Text
	  property :password, Text    
    property :created_at, DateTime
    property :login_times, Integer
end