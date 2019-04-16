class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = find_question
    @answer = Answer.new
    @similar_answer = QuestionSearch.new(@question.id, @question.description).similar_answer
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params.merge(user: current_user))

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Вопрос был успешно создан." }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @question = find_question
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Вопрос был успешно удалён." }
    end
  end

  private

  def find_question
    Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:description, :category_id)
  end
end
