class ApplicationController < ActionController::Base
    before_action :set_search

    def set_search
        @search = Item.where(listing_stop: 0).ransack(params[:q])
        @items = @search.result.page(params[:page])
    end

    def after_sign_up_path(resource)
        root_path
    end

    def after_sign_in_path_for(resource)
        case resource
        when User
            root_path
        when Administrator
            admin_path
        end
    end

    def after_sign_out_path_for(resource_or_scope)
        if resource_or_scope == :user
            root_path
        else 
            new_administrator_session_path
        end
    end


    private 

        def logical_delete_user
            if current_user&.is_delete == 'remove'
                flash[:alert] = 'このアカウントは現在使用することができません'
                redirect_to root_path
            end
        end

end
