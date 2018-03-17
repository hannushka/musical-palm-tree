class SettingsController < ApplicationController
    
    def edit
		@setting = Setting.find(params[:id])
    end

    def update
        @setting = Setting.find(params[:id])
        if @setting.update_attributes(settings_params)
          flash[:success] = "Inställningarna har uppdaterats."
          redirect_to edit_setting_path(@setting)
        else
          render 'edit'
        end
      end

    private
        def settings_params
            params.require(:setting).permit(:id, :nbr_contestants)
        end
end
