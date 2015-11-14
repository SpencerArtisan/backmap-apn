require 'grocer'

pusher = Grocer.pusher(
  certificate: 'ck.pem', passphrase: '3menin@boat', gateway: 'gateway.sandbox.push.apple.com'
)

notification = Grocer::Notification.new(
  device_token: "298ab13aaea1ec9daf8fee9d3173d8d6b69f2043820a599c3e526b2645c7c28c", badge: 11, alert: 'hey'
)

pusher.push notification


