//
//  MarkerCollection.swift
//  MastodonKit
//
//  Created by Sören Kuklau on 28.04.22.
//

import Foundation

public class MarkerCollection: Codable {
    /** Information about the user's position in the home timeline. */
    public let home: Marker
    
    /** Information about the user's position in their notifications. */
    public let notifications: Marker
}
