//
//  FollowRequests.swift
//  MastodonKit
//
//
//  Created by Luo Sheng on 2023/2/15.
//  https://github.com/Pop-Tap/MastodonKit/commit/1cd737070622f39e4307fa25682950c06149e7aa
//  https://github.com/Pop-Tap/MastodonKit/commit/84a205d1c0d82bc7a3854265a1346333858fd54c
//

import Foundation

/// `Tags` requests.
public enum Tags {
    public static func followed() -> Request<[Tag]> {
        let method = HTTPMethod.get(.empty)
        return Request<[Tag]>(path: "/api/v1/followed_tags", method: method)
    }

    public static func tag(name: String) -> Request<Tag> {
        return Request<Tag>(path: "/api/v1/tags/\(name)", method: .get(.empty))
    }

    public static func follow(name: String) -> Request<Tag> {
        return Request<Tag>(path: "/api/v1/tags/\(name)/follow", method: .post(.empty))
    }

    public static func unfollow(name: String) -> Request<Tag> {
        return Request<Tag>(path: "/api/v1/tags/\(name)/unfollow", method: .post(.empty))
    }
}
