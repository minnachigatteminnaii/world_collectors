class Admin::ContactsController < ApplicationController
    before_action :authenticate_administrator!

    def index
        @contacts = Contact.page(params[:page]).per(15)
    end

    def show
        @contact = Contact.find(params[:id])
    end

    def reply
        reply = params[:reply]
        contact = Contact.find(params[:contact])
        ContactMailer.reply_user(reply, contact).deliver_now
        flash[:notice] = '正常に返信が行われました'
        redirect_to admin_path
    end
end
