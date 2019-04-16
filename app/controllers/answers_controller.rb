class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params.merge(user: current_user))

    if @answer.save
      redirect_to @answer.question, notice: "Ответ был успешно добавлен."
    else
      redirect_to @answer.question, notice: "Ответ не может быть пустым."
    end
  end

  def vote
    @answer = Answer.find(params[:answer_id])
    VoteManager.vote(current_user, @answer)
    redirect_to @answer.question, notice: "Ваш голос был учтён."
  end

  def destroy
    @answer = find_answer
    @question = @answer.question
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to @question, notice: "Ответ был успешно удалён." }
    end
  end

  private

  def find_answer
    Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
