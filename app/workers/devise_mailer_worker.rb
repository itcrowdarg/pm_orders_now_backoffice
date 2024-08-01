class DeviseMailerWorker
  include Devise::Mailers::Helpers
  include Sidekiq::Worker
  sidekiq_options queue: 'normal'
  sidekiq_options retry: false
  sidekiq_options failures: true

  def perform(record_id, token, opts, email_action)
    record = User.find(record_id)

    case email_action
    when 'confirmation_instructions'
      opts[:template_path] = 'auth/mailer'
      Devise::Mailer.confirmation_instructions(record, token, opts).deliver

    when 'reset_password_instructions'
      opts[:template_path] = 'auth/mailer'
      Devise::Mailer.reset_password_instructions(record, token, opts).deliver

    when 'unlock_instructions'
      Devise::Mailer.unlock_instructions(record, token, opts).deliver

    when 'email_changed'
      Devise::Mailer.email_changed(record, opts).deliver

    when 'password_change'
      Devise::Mailer.password_change(record, opts).deliver
    end
  rescue StandardError => e
    raise Exception, e.message
  end
end
