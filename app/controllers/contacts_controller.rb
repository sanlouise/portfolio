class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      comments = params[:contact][:comments]
      
      ContactMailer.contact_email(name, email, comments).deliver

      redirect_to new_contact_path, notice: "Your message was sent successfully! 
      I'll get back to you as soon as possible."
    else
      redirect_to new_contact_path, notice: "Oops, an error occured. Are you sure you 
      did not leave a field blank?"
    end
    
  end
  
  private
    def contact_params
      # "white listing" these parameters
      params.require(:contact).permit(:name, :email, :comments)
    end

end
