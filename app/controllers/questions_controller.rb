class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]

  def index
    @questions = policy_scope(Question).order(created_at: :asc)
  end

  def new
    @question = Question.new
    authorize @question
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    authorize @question
    if @question.save
      redirect_to questions_path, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
      redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    def set_question
      @question = Question.find(params[:id])
      authorize @question
    end

    def question_params
      params.require(:question).permit(:evenement_id, :categorie, :contenu)
    end
end
