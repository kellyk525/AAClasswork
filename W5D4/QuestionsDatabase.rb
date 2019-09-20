require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database 
  include Singleton

  def initialize 
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Questions
  attr_accessor :id, :title, :body, :associated_author
  def self.find(id)
    question_data = QuestionsDatabase.get_first_row(<<-SQL, id: id)
      SELECT
        questions.*
      FROM
        questions
      WHERE
        questions.id = :id
    SQL

    Questions.new(question_data)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @associated_author = options['associated_author']
  end
  
end

class Users

  attr_accessor :id, :fname, :lname

  def self.find(id)
    user_data = QuestionsDatabase.get_first_row(<<-SQL, id: id)
      SELECT
        users.*
      FROM
        users
      WHERE
        users.id = :id
    SQL

   Users.new(user_data)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
end

class Question_follows

  attr_accessor :id, :question_id, :user_id

  def self.find(id)
    question_follow_data = QuestionsDatabase.get_first_row(<<-SQL, id: id)
      SELECT
        question_follows.*
      FROM
        question_follows
      WHERE
        question_follows.id = :id
    SQL

    Question_follows.new(question_follow_data)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end

class Replies

  attr_accessor :id, :subject_question, :parent_reply, :user, :body

  def self.find(id)
    reply_data = QuestionsDatabase.get_first_row(<<-SQL, id: id)
      SELECT
        replies.*
      FROM
        replies
      WHERE
        replies.id = :id
    SQL

    Replies.new(reply_data)
  end

  def initialize(options)
    @id = options['id']
    @subject_question = options['subject_question']
    @parent_reply = options['parent_reply']
    @user = options['user']
    @body = options['body']
  end
end

class Question_likes

  attr_accessor :id, :question_id, :user_id

  def self.find(id)
    question_like_data = QuestionsDatabase.get_first_row(<<-SQL, id: id)
      SELECT
        questions_likes.*
      FROM
        questions_likes
      WHERE
        questions_likes.id = :id
    SQL

    Question_Likes.new(question_like_data)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end