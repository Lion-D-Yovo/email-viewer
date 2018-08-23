class EmailController < ApplicationController

    def new
        @email = Email.new
    end

    def create
        @email = Email.create(email_params)
        if @email.save
        respond_to do |format|
            format.html { redirect_to email_url }
            format.js   ## cela va rendre create.js.erb
            end
        end
    end

    def index
        @emails = Email.all
    end

    private

    def email_params
        params.require(:email).permit(:object, :body)
    end
end
