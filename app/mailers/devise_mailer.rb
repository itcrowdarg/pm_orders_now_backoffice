class DeviseMailer < Devise::Mailer
  def confirmation_instructions(record, token, opts = {})
    DeviseMailerWorker.perform_async(record.id, token, opts.stringify_keys, 'confirmation_instructions')
  end

  def reset_password_instructions(record, token, opts = {})
    DeviseMailerWorker.perform_async(record.id, token, opts.stringify_keys, 'reset_password_instructions')
  end

  def unlock_instructions(record, token, opts = {})
    DeviseMailerWorker.perform_async(record.id, token, opts.stringify_keys, 'unlock_instructions')
  end

  def email_changed(record, opts = {})
    DeviseMailerWorker.perform_async(record.id, nil, opts.stringify_keys, 'email_changed')
  end

  def password_change(record, opts = {})
    DeviseMailerWorker.perform_async(record.id, nil, opts.stringify_keys, 'password_change')
  end
end
