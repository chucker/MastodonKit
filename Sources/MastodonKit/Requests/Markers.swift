//
//  Markers.swift
//  MastodonKit
//
//  Created by Sören Kuklau on 28.04.22.
//

import Foundation

/**
 `Markers` requests:
 Save and restore your position in timelines.
 */
public enum Markers {
    /// Get saved timeline position.
    ///
    /// - Parameter timelines: The timelines whose positions to retrieve.
    /// - Returns: Request for `MarkerCollection`.
    public static func all(timelines: [MarkerTimeline]) -> Request<MarkerCollection> {
        /// there might be a better way of doing this in `Payload`, but I couldn't find it
        let parameters = [
            Parameter(name: "timeline", value: "[\"" + timelines.compactMap { $0.rawValue }
                                                                .joined(separator: "\",\"") + "\"]")
        ]
        
        let method = HTTPMethod.get(.parameters(parameters))
        return Request<MarkerCollection>(path: "/api/v1/markers", method: method)
    }
    
    public static func update(markers: MarkerCollection) -> Request<MarkerCollection> {
        // the API also lets us just update one or the other, but we don't implement that here
        
        let parameters : [FormParameter] = [
            Parameter(name: "home[last_read_id]", value: markers.home.lastReadId),
            Parameter(name: "notifications[last_read_id]", value: markers.notifications.lastReadId)
        ]
        
        let method = HTTPMethod.post(.form(parameters))
        return Request<MarkerCollection>(path: "/api/v1/markers", method: method)
    }
}
