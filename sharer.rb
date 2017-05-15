require 'firebase'
require 'ostruct'
require 'houston'

certificate = File.read('production_Artisan.I-ll-Be-Back.pem')
passphrase = 'T1ypDfyp!'
connection = Houston::Connection.new(Houston::APPLE_DEVELOPMENT_GATEWAY_URI, certificate, passphrase)
connection.open

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
    notification = Houston::Notification.new(device: user.device)
    notification.badge = user.shares
    puts notification.inspect

    connection.write(notification.message)
  end
end

connection.close
