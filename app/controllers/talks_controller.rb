class TalksController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @talk = Talk.new(talk_params)
        if @talk.save
            @user = User.find(@talk.receiver_user_id)
            ContactMailer.sent(@user).deliver 
            redirect_to("/user/#{@user.id}/talk")
        else
            @talk = []
            redirect_to("/user/#{@user.id}/talk")
        end
    end
    
    private
  
    def talk_params
        params.require(:talk).permit(:written_user_id, :receiver_user_id, :message)
    end
        
end