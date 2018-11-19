class RegistrationsController < Devise::RegistrationsController
   before_action :authenticate_user!
   
    def after_sign_up_path_for(resource)
        user_path(resource)
    end
    
    def after_sign_in_path_for(resource)
        user_path(current_user.id)
    end
    
    private
    
      def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :message)
      end
      
      def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :image, :message)
      end
end
  