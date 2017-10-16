class ContactsController < ApplicationController 
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            name = params[:contact][:name]
            email = params[:contact][:name]
            body = params[:contact][:name]
            
            ContactMailer.contact_email(name, email, body)
            flash[:success] = "The message has been submitted successfully."
            redirect_to new_contact_path
        else
            flash[:danger] = "An error has occurred while attempting to send your message."
            redirect_to new_contact_path
        end
    end
    
    private
     def contact_params
         params.require(:contact).permit(:name, :email, :comment)
     end
end