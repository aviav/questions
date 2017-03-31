class QuestionsController < ApplicationController
  def index
    @questions = Question.all

    render json: @questions
  end

  def create
    @question = Question.new(permitted_params)
    if @question.save
      render json: @question
    end
  end

  private

  def permitted_params
    params.require(:question).permit(:title)
  end
end
