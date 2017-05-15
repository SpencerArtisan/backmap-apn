require 'grocer'

pusher = Grocer.pusher(
	certificate: 'certificatedev.pem', passphrase: 'T1ypDfyp!', gateway: 'gateway.push.apple.com'
)

notification = Grocer::Notification.new(
  device_token: "4bef0589e4a186a5d1ec8a135db472dd75550a285b44c0820a84eedaf3806294", badge: 8
)

puts notification.inspect
pusher.push notification


