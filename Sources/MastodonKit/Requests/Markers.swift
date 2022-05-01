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
        let parameters = timelines.map(toArrayOfParameters(withName: "timeline"))
        let method = HTTPMethod.get(.parameters(parameters))
        return Request<MarkerCollection>(path: "/api/v1/markers", method: method)
    }
    
    public static func update(markers: MarkerCollection) -> Request<MarkerCollection> {
        // the API also lets us just update one or the other, but we don't implement that here
        
        var parameters = [FormParameter]()
        
        if (markers.home != nil) {
            parameters.append(Parameter(name: "home[last_read_id]", value: markers.home!.lastReadId))
        }
        
        if (markers.notifications != nil) {
            parameters.append(Parameter(name: "notifications[last_read_id]", value: markers.notifications!.lastReadId))
        }
        
        let method = HTTPMethod.post(.form(parameters))
        return Request<MarkerCollection>(path: "/api/v1/markers", method: method)
    }
}
