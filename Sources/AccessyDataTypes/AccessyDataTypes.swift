

import Foundation

///////////////////////////////////////////////////////////////
///
///
///   PROTOCOLS
///
///
///////////////////////////////////////////////////////////////

public protocol DateRepresentable {
  var createdAt: Date? { get }
  var updatedAt: Date? { get }
  var deletedAt: Date? { get }
}

public protocol PathRepresentable {
  var pathCoordinates: [Coordinate] { get }
}

public protocol IDRepresentable {
  var id: UUID? { get }
}

public protocol AdjacentInfrastructuresRepresentable {
  var adjacentInfrastructures: [String] { get }
}

public typealias InfrastructureType = DateRepresentable & PathRepresentable & IDRepresentable & Codable

///////////////////////////////////////////////////////////////
///
///
///   INFRASTRUCTURE TYPES
///
///
///////////////////////////////////////////////////////////////

public struct Infrastructure: Codable {
  public let sidewalks: [Sidewalk]
  public let trafficLights: [TrafficLight]
  public let trafficIsland: [TrafficIsland]
  public let zebraCrossing: [ZebraCrossing]
  public let pedestrianCrossing: [PedestrianCrossing]
  public let intersectionNodes: [IntersectionNode]
  ///
  public init(sidewalks: [Sidewalk] = [],
              trafficLights: [TrafficLight] = [],
              trafficIsland: [TrafficIsland] = [],
              zebraCrossing: [ZebraCrossing] = [],
              pedestrianCrossing: [PedestrianCrossing] = [],
              intersectionNodes: [IntersectionNode] = []) {
    self.sidewalks = sidewalks
    self.trafficLights = trafficLights
    self.trafficIsland = trafficIsland
    self.zebraCrossing = zebraCrossing
    self.pedestrianCrossing = pedestrianCrossing
    self.intersectionNodes = intersectionNodes
  }
}

public struct Sidewalk: InfrastructureType {
  public let id: UUID?
  public let pathCoordinates: [Coordinate]
  public let createdAt: Date?
  public let updatedAt: Date?
  public let deletedAt: Date?
  ///
  public init(id: UUID? = nil,
              pathCoordinates: [Coordinate],
              createdAt: Date? = nil,
              updatedAt: Date? = nil,
              deletedAt: Date? = nil) {
    self.id = id
    self.pathCoordinates = pathCoordinates
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.deletedAt = deletedAt
  }
}

public struct TrafficLight: InfrastructureType {
  public let id: UUID?
  public let pathCoordinates: [Coordinate]
  public let createdAt: Date?
  public let updatedAt: Date?
  public let deletedAt: Date?
}

public struct TrafficIsland: InfrastructureType {
  public let id: UUID?
  public let pathCoordinates: [Coordinate]
  public let createdAt: Date?
  public let updatedAt: Date?
  public let deletedAt: Date?
}

public struct ZebraCrossing: InfrastructureType {
  public let id: UUID?
  public let pathCoordinates: [Coordinate]
  public let createdAt: Date?
  public let updatedAt: Date?
  public let deletedAt: Date?
}

public struct PedestrianCrossing: InfrastructureType {
  public let id: UUID?
  public let pathCoordinates: [Coordinate]
  public let createdAt: Date?
  public let updatedAt: Date?
  public let deletedAt: Date?
}

public struct IntersectionNode: DateRepresentable, IDRepresentable, AdjacentInfrastructuresRepresentable, Codable {
  public let id: UUID?
  public let coordinate: Coordinate
  public let createdAt: Date?
  public let updatedAt: Date?
  public let deletedAt: Date?
  //
  public let adjacentInfrastructures: [String]
  ///
  public init(id: UUID? = nil,
              coordinate: Coordinate,
              createdAt: Date? = nil,
              updatedAt: Date? = nil,
              deletedAt: Date? = nil,
              adjacentInfrastructures: [String] = []) {
    self.id = id
    self.coordinate = coordinate
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.deletedAt = deletedAt
    self.adjacentInfrastructures = adjacentInfrastructures
  }
}

///////////////////////////////////////////////////////////////
///
///
///   SUBTYPES
///
///
///////////////////////////////////////////////////////////////

public struct Coordinate: Codable {
  public let latitude: Double
  public let longitude: Double
  public init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
}

///////////////////////////////////////////////////////////////
///
///
///   REQUESTS
///
///
///////////////////////////////////////////////////////////////

public struct CreateSidewalk: PathRepresentable {
  public let pathCoordinates: [Coordinate]
  public let intersectionNodes: [String]
}

public struct Region {
  public let latitude: Double
  public let longitude: Double
  public let radius: Double
  
  public init(coordinate: Coordinate, radius: Double) {
    self.latitude = coordinate.latitude
    self.longitude = coordinate.longitude
    self.radius = radius
  }
  
  public init(latitude: Double, longitude: Double, radius: Double) {
    self.latitude = latitude
    self.longitude = longitude
    self.radius = radius
  }
}


///////////////////////////////////////////////////////////////
///
///
///   ROUTING
///
///
///////////////////////////////////////////////////////////////

