ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "story.com",
    :user_name            => "cui.liqiang",
    :password             => "54188000",
    :authentication       => "plain",
    :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "stormy-day-2454.herokuapp.com"