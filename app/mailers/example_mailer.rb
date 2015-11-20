class ExampleMailer < ApplicationMailer
  default from: "dannyshafer@gmail.com"

  def sample_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => @user.email,
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'MAKING PANCAKES MAKING BACON PANCAKES. TAKE SOME BACON AND I PUT IT IN A PANCAKE. MAKING PANCAKESSSSSSSS'}
    mg_client.send_message ENV['domain'], message_params
  end
end
