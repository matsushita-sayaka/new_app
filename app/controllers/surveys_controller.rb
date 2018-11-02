class SurveysController < ApplicationController
before_action :authenticate_user!
    def create
        @survey = current_user.surveys.new(survey_params)
        if @survey.save
            redirect_to :back
        end
    end

    
private
  
  def survey_params
    params.require(:survey).permit(:category, :question_1, :question_2)
  end


end