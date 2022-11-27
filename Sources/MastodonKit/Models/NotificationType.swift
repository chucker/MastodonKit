//
//  NotificationType.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum NotificationType: Codable, RawRepresentable, Equatable {
    
    public typealias RawValue = String
    
    /// Someone mentioned you in their status
    case mention
    /// Someone you enabled notifications for has posted a status
    case status
    
    /// Someone followed you
    case follow
    /// Someone requested to follow you
    case follow_request
    
    /// Someone boosted one of your statuses
    case reblog
    /// Someone favourited one of your statuses
    case favourite
    
    /// A poll you have voted in or created has ended
    case poll
    
    /// A status you interacted with has been edited
    case update
    
    /// Someone signed up (optionally sent to admins)
    case admin_sign_up
    /// A new report has been filed
    case admin_report
    
    /// An unknown notification type
    case other(String)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        switch try container.decode(String.self) {
        case "mention": self = .mention
        case "status": self = .status
            
        case "follow": self = .follow
        case "follow_request": self = .follow_request
            
        case "reblog": self = .reblog
        case "favourite": self = .favourite
            
        case "poll": self = .poll
            
        case "update": self = .update
            
        case "admin.sign_up": self = .admin_sign_up
        case "admin.report": self = .admin_report
            
        case let other: self = .other(other)
        }
    }
    
    public init?(rawValue: String) {
        switch rawValue {
        case "mention": self = .mention
        case "status": self = .status
            
        case "follow": self = .follow
        case "follow_request": self = .follow_request
            
        case "reblog": self = .reblog
        case "favourite": self = .favourite
            
        case "poll": self = .poll
            
        case "update": self = .update
            
        case "admin.sign_up": self = .admin_sign_up
        case "admin.report": self = .admin_report
            
        case let other: self = .other(other)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .mention: try container.encode("mention")
        case .status: try container.encode("status")

        case .follow: try container.encode("follow")
        case .follow_request: try container.encode("follow_request")

        case .reblog: try container.encode("reblog")
        case .favourite: try container.encode("favourite")

        case .poll: try container.encode("poll")

        case .update: try container.encode("update")

        case .admin_sign_up: try container.encode("admin.sign_up")
        case .admin_report: try container.encode("admin.report")

        case .other(let other): try container.encode(other)
        }
    }
    
    public var rawValue: String {
        switch self {
        case .mention: return "mention"
        case .status: return "status"

        case .follow: return "follow"
        case .follow_request: return "follow_request"

        case .reblog: return "reblog"
        case .favourite: return "favourite"

        case .poll: return "poll"

        case .update: return "update"
            
        case .admin_sign_up: return("admin.sign_up")
        case .admin_report: return("admin.report")

        case .other(let other): return other
        }
    }
}
