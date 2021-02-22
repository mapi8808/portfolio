class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # お問い合わせ内容をデータベースに保存した後、メール送信を行う。
      ContactMailor.contact_mail(@contact).deliver
      redirect_to new_contact
    else
      redirect_to new_contact
    end
  end
  
   private

  def contact_params
    params.require(:contact).permit(:name, :message)
  end
  
end
