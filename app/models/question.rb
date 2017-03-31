class Question
  include ActiveModel::Model

  def initialize(params = {})
    @title = params[:title]
  end

  attr_reader :title

  def self.all
    headings_json = ::Org::File.to_json('questions')
    headings = JSON.parse(headings_json)
    headings.map do |heading|
      Question.new(title: heading['item'])
    end
  end

  def save
    ::Org::File.insert_heading('questions', title)
  end
end
