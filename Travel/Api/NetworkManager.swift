

import Foundation




class NetworkManager {
    
    static let shared = NetworkManager()
    
    let headers = [
        "x-rapidapi-key": "XXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        "x-rapidapi-host": "mountain-api1.p.rapidapi.com"
    ]
    
    func getHero(complition: @escaping (Adventure) -> Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://mountain-api1.p.rapidapi.com/api/mountains/")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) -> Void in
            guard let data else { return }
            
            if let mounts = try? JSONDecoder().decode(Adventure.self, from: data) {
                complition(mounts)
                
            } else {
                print("Fail")
            }
        })
        dataTask.resume()
    }
}

