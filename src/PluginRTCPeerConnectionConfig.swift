import Foundation


class PluginRTCPeerConnectionConfig {
	private var iceServers: [RTCICEServer] = []


	init(pcConfig: NSDictionary?) {
		NSLog("PluginRTCPeerConnectionConfig#init()")

		var iceServers = pcConfig?.objectForKey("iceServers") as? [NSDictionary]

		if iceServers == nil {
			return
		}

		for iceServer: NSDictionary in iceServers! {
			var url = iceServer.objectForKey("url") as? String
			var username = iceServer.objectForKey("username") as? String
			var password = iceServer.objectForKey("password") as? String

			if (url != nil) {
				NSLog("PluginRTCPeerConnectionConfig#init() | adding ICE server [url:\(url!)]")

				self.iceServers.append(RTCICEServer(
					URI: NSURL(string: url!),
					username: username != nil ? username : "",
					password: password != nil ? password : ""
				))
			}
		}
	}


	func getIceServers() -> [RTCICEServer] {
		NSLog("PluginRTCPeerConnectionConfig#getIceServers()")

		return self.iceServers
	}
}
