class RegistrationsController < Devise::RegistrationsController
    
    def after_sign_up_path_for(resource)
        user_path(resource)
    end

    private
      def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :message)
      end
      
      def accountupdate_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :image, :message)
      end
end
  