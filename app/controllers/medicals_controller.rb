class MedicalsController < ApplicationController
  def new
    @medical = Medical.new
  end

  def create
    @medical = Medical.new(medical_params)
    if @medical.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def medical_params
    params.require(:medical).permit(:subject).merge(user_id: current_user.id)
  end
end
