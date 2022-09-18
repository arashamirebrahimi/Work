#email:string
#password_digest:string

#password:string virtual
#password_confirmation:string virtual

class User < ApplicationRecord
    has_secure_password
    #going to use the password_digest column and add "password" and "password confirmation" to user
    #uses bcrypt you have to go in Gem file and delete the "#"
    #then run bundle install again

    validates :email, presence: true, format:{ with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email address"}
    #another way is to go to migarte/use and put null:false in front of "email", this will check it on console level
    #then you have to do rail db:rollback then migrate again so the change goes in effect
    #or rails db:migrate:redo
    # that format called email regex and checks for valid email addresses
    #means your email address needs to have any charachters(\A) that are not space or @,need one @ symbol and again any character 
    #but space(denoted as "^")
end
