class InvitesController < ApplicationController
    before_action :authenticate_user!
    def new
        @invite = Invite.new
    end
    
    def create
        @invite = current_user.invites.new(invite_params)
        if @invite.save
            InviteMailer.sent(@invite).deliver
            flash[:success] = "友達にメールを送りました！"
            redirect_to users_path
        else
            render invite_path
        end
    end
    
     private
  
      def invite_params
        params.require(:invite).permit(:email, :message, :user_id)
      end
end
