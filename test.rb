require 'grocer'

pusher = Grocer.pusher(
  certificate: 'ckProd.pem', passphrase: '3menin@boat', gateway: 'gateway.push.apple.com'
)

notification = Grocer::Notification.new(
  device_token: "1bf5ba0760676d3e9b4780b3d07e0410dbdd8581c0dc4eb5eb1da5eaf763aa54", badge: 8
)

puts notification.inspect
pusher.push notification


