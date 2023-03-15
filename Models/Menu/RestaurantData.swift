//
//  RestaurantData.swift
//  MENUApp
//
//  Created by Mac on 15.3.23..
//

import Foundation


struct RestaurantData: Identifiable, Equatable, Hashable {
    var id: Int
    var title: String
    var distance: String
    var address: String
    var availability: String
    var welcomeMessage: String
    var description: String
    var image: String
    var servingTimes: String
    
    init(venue: VenueElement) {
        self.title = venue.venue?.name ?? ""
        let distance = venue.distance
        self.distance = distance != nil ? String(distance!) : ""
        self.address = venue.venue?.address ?? ""
        self.description = venue.venue?.description ?? ""
        self.image = venue.venue?.image?.thumbnailMedium ?? ""
        self.availability = venue.venue?.deliveryTravelType ?? ""
        self.welcomeMessage = venue.venue?.welcomeMessage ?? ""
        self.id = venue.id
        
        let firstTime = venue.venue?.servingTimes?.first
        let startTime = firstTime?.timeFrom ?? ""
        let endTime = firstTime?.timeTo ?? ""
        if !startTime.isEmpty && !endTime.isEmpty {
            self.servingTimes = startTime + "-" + endTime
        } else {
            self.servingTimes = ""
        }
    }
    
    static func == (lhs: RestaurantData, rhs: RestaurantData) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
