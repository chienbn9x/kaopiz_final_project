class MyMailer < Devise::Mailer   
    def headers_for(action, opts)
      super.merge!({template_path: '/users/mailer'}) # this moves the Devise template path from /views/devise/mailer to /views/mailer/devise
  end
  end