class InvoiceBuilderController < WebsocketRails::BaseController
  before_filter :authenticate_user!

  def timbrar
    puts message
    puts current_user.inspect
    sleep( 30 )
    send_message :timbrar_success, { :message => 'Successfully timbre' }
  end
end
