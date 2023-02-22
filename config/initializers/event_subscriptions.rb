Rails.application.config.to_prepare do
  Wisper.clear if Rails.env.development? || Rails.env.test?

  unless Rails.env.test?
    Wisper.subscribe(NotificationSubscriber.new)
    Wisper.subscribe(LoanSubscriber.new)
    Wisper.subscribe(FraudSubscriber.new)
  end
end
