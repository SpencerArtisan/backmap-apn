require 'firebase'
require 'ostruct'
require 'grocer'

pusher = Grocer.pusher(
  certificate: 'certificate.pem', passphrase: 'T1ypDfyp!', gateway: 'gateway.push.apple.com'
)

def users
  base_uri = 'https://illbeback.firebaseio.com/'
  firebase = Firebase::Client.new(base_uri)
  response = firebase.get("users", {})
  response.body.map do |user| 
    OpenStruct.new(name: user[0], shares: user[1]['given'] == nil ? 0 : user[1]['given'].size, device: user[1]['device']) if user[1]['device'] != nil
  end.compact
end

users.each do |user|
  if user.device != "ff"
    puts user
    notification = Grocer::Notification.new(device_token: user.device, badge: user.shares)
    puts notification.inspect
    pusher.push notification
  end
end
