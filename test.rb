require 'grocer'

pusher = Grocer.pusher(
  certificate: 'certificate.pem', passphrase: 'T1ypDfyp!', gateway: 'gateway.push.apple.com'
)

notification = Grocer::Notification.new(
  device_token: "7bc7bfad910f8dcc6b44265bf10aef4bf41a6ae2", badge: 8
)

puts notification.inspect
pusher.push notification


