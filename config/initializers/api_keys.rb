ENV['API_URL'] = if Rails.env.development? || Rails.env.test?
                   Rails.application.credentials.api_urls.development
                 elsif Rails.env.staging?
                   Rails.application.credentials.api_url.staging
                 else
                   Rails.application.credentials.api_url.production
                 end