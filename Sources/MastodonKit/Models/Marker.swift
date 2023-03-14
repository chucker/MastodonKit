//
//  Marker.swift
//  MastodonKit
//
//  Created by Sören Kuklau on 28.04.22.
//

import Foundation

public class Marker: Codable {
    /** The ID of the most recently viewed entity. */
    public let lastReadId: String
    
    /** The timestamp of when the market was set. */
    public let updatedAt: Date
    
    /** Used for locking to prevent write conflicts. */
    public let version: Int
    
    public init(lastReadStatus: Status) {
        self.lastReadId = lastReadStatus.id
        self.updatedAt = Date()
        self.version = 1
    }
    
    private enum CodingKeys: String, CodingKey {
        case lastReadId = "last_read_id"
        case updatedAt = "updated_at"
        case version
    }
}
