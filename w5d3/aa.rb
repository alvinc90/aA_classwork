require 'sqlite3'
require 'singleton'

class QuestionsDatabase << SQLite3::Database 
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

# SQLite3::Database.new(file, options = {}) ⇒ Object 
# Create a new Database object that opens the given file.
class Users

    attr_accessor :fname, :lname

    def self.find_by_name(fname, lname)
        user = QuestionDatabase.instance.execute(<<-SQL, fname, lname)

        SELECT
            *
        FROM
            users
        WHERE
            fname = ?
            lname = ?
        SQL
        Users.new(user.first)
    end

    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
        
        SELECT
            *
        FROM
            users
        WHERE
            id = ?
        SQL

        Users.new(user.first)
    end

    def initialize(option)
        @id = option['id']
        @fname = option['fname']
        @lname = option['lname']
    end

end

class Questions

    attr_accessor :title, :body, :author

    def self.find_by_author_id(id) 
        question = QuestionDatabase.instance.execute(<<- SQL, id)
    end

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
        
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        Questions.new(question.first)
    end

    def initialize(option)
        @id = option['id']
        @title = option['title']
        @body = option['body']
        @author = option['author']
    end

end

class Replies

    attr_accessor :users_id, :questions_id, :body, :parent_id

    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        Replies.new(reply.first)
    end

     def initialize(option)
        @id = option['id']
        @users_id = option['users_id']
        @questions_id = option['questions_id']
        @body = option['body']
        @parent_id = option['parent_id']
    end

end

class QuestionLikes

    attr_accessor :questions_id, :users_id 

    def self.find_by_user(fname)
        user_liked = QuestionsDatabase.instance.exectue(<<-SQL, fname)

        SELECT
            *
        FROM
            question_likes
        WHERE
            fname = ?
        SQL
        QuestionLikes.new(user_like.first)
    end

    def self.find_by_id(id)
        like = QuestionsDatabase.instance.execute(<<-SQL, id)
        
        SELECT
            *
        FROM
            question_likes
        WHERE
            id = ?
        SQL
        QuestionLikes.new(like.first)
    end

    def initialize(option)
        @id = option['id']
        @users_id = option['users_id']
        @questions_id = option['questions_i']
    end

end

class QuestionFollows

    attr_accessor :users_id, :questions_id

    def self.find_by_id(id)
        follower = QuestionsDatabase.instance.execute(<<-SQL, id)
        
        SELECT
            *
        FROM
            question_follows
        WHERE
            id = ?
        SQL
        QuestionFollows.new(follower.first)
    end

     def initialize(option)
        @id = option['id']
        @users_id = option['users_id']
        @questions_id = option['questions_id']
    end

end