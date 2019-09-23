class ContactsController < ApplicationController
    before_action :logical_delete_user
    before_action :authenticate_user!


    def new
        @contact = Contact.new
    end

    def create
        @contact = current_user.contacts.build(contact_params)
        if @contact.save
            flash[:notice] = "お問い合わせが完了いたしました"
            redirect_to root_path
        else
            render 'new'
        end
    end


    private

        def contact_params
            params.require(:contact).permit(:title, :body)
        end
end
