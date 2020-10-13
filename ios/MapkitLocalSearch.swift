import MapKit

@objc(MapkitLocalSearch)
class MapkitLocalSearch: NSObject {
    @objc(searchForLocations:withRegion:withResolver:withRejecter:)
    func searchForLocations(searchText: String, region: Dictionary<String, Double>, resolve:@escaping RCTPromiseResolveBlock,reject: @escaping RCTPromiseRejectBlock) -> Void {
        guard let latitude: Double = region["latitude"] else {
            reject("Error", "`latitude` attribute for `region` does not exist", NSError.init(domain: "Init", code: 500, userInfo: [:]))
            return
        }
        guard let longitude: Double = region["longitude"] else {
            reject("Error", "`longitude` attribute for `region` does not exist", NSError.init(domain: "Init", code: 500, userInfo: [:]))
            return
        }
        
        guard let latitudeDelta: Double = region["latitudeDelta"] else {
            reject("Error", "`longitudeDelta` attribute for `region` does not exist", NSError.init(domain: "Init", code: 500, userInfo: [:]))
            return
        }
        
        guard let longitudeDelta: Double = region["longitudeDelta"] else {
            reject("Error", "`longitudeDelta` attribute for `region` does not exist", NSError.init(domain: "Init", code: 500, userInfo: [:]))
            return
        }
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        
        let coordinateRegion = MKCoordinateRegion(center: coordinates, span: coordinateSpan)
        
        let localSearchRequest = MKLocalSearch.Request()
        localSearchRequest.naturalLanguageQuery = searchText
        localSearchRequest.region = coordinateRegion

        let searchRequest = MKLocalSearch(request: localSearchRequest)
        
        var formattedResponse:[Any] = []
           
        searchRequest.start {(response, error) -> Void in
            guard let response = response else {
                reject("Error in search", "", error)
                return
            }

            var locations: [String: String] = [:]
            for item in response.mapItems {
                if let name = item.name,
                    let location = item.placemark.location {
                    var formattedLocation: [String:Any] = [:]
                    formattedLocation["name"] = item.name
                    formattedLocation["title"] = item.placemark.title
                    formattedLocation["latitude"] = item.placemark.coordinate.latitude
                    formattedLocation["longitude"] = item.placemark.coordinate.longitude
                    formattedLocation["isoCountryCode"] = item.placemark.isoCountryCode
                    formattedLocation["country"] = item.placemark.country
                    formattedResponse.append(formattedLocation)
                }
            }
            resolve(formattedResponse)
        }
        
    }
}
