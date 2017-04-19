Rails.configuration.stripe = {
  :publishable_key => 'pk_test_xscw7QPdUUD3ld0tRCNjbcv4',
  :secret_key      => 'sk_test_9aV9ZZ0OIy6jycJpWvpTiwQ2'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
