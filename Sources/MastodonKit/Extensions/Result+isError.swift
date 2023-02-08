//
//  Result+isError.swift
//  MastodonKit
//
//  Created by Sören Kuklau on 04.02.23.
//

extension Result {
    var isError: Bool {
        switch self {
        case .success:
            return false
        case .failure:
            return true
        }
    }
}
