class ExamsController < ApplicationController
  before_action :set_medical

  def index
    @exams = @medical.exams.includes(:user).order("exam_date DESC")
  end

  def new
    @exam = Exam.new
  end
  
  def create
    @exam = @medical.exams.new(exam_params)
    if @exam.save
      redirect_to medical_exams_path(@medical), notice: 'Record was successfully created.'
    else
      @exams = @medical.exams.includes(:user)
      render :new, status: :unprocessable_entity
      # バリデーションエラー出力
    end
  end

  private

  def set_medical
    @medical = Medical.find(params[:medical_id])
  end

  def exam_params
    params.require(:exam).permit(:image, :title, :hospital, :exam_date, :comment).merge(user_id: current_user.id)
  end

end
