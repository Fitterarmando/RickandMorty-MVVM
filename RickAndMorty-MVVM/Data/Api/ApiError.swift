//
//  ApiError.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 25/04/23.
//

import Foundation

public enum ApiError: Error {
    case jsonDecodingError
    case serverError(error: String)
    case badRequestData(data: Data)
    case badRequest
    case responseErrorMessage(message: String)
    case notInternetConection
    case multipartEncodingError
    case apiDefinedError(error: ApiDefinedError)
}

public struct ApiDefinedError: Codable {
    public let error: String
    public let errorDescription: String
}
