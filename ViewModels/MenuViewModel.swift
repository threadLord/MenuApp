//
//  MenuViewModel.swift
//  MENUApp
//
//  Created by Mac on 10.3.23..
//

import Combine

final class MenuViewModel: ObservableObject {
    
    var menuManager: MenuManagerProtocol = Resolver.shared.resolve(MenuManagerProtocol.self)
    
    @Published
    var error: Error?
    
    var latAndLong = PassthroughSubject<LatAndLong, Error>()
    
    @Published
    var menuData: [VenueElement] = []
    
    var cancel = Set<AnyCancellable>()
    
    let lat = 44.001783
    let long = 21.26907
    
    init() {
        subscribe()
        latAndLong.send((lat, long))
    }

    func subscribe() {
        latAndLong
            .flatMap (fetchMenuData)
            .replaceError(with: nil)
            .map({ $0?.venues ?? [] })
            .eraseToAnyPublisher()
            .assign(to: &$menuData)
    }

    typealias LatAndLong = (Double, Double)

    func fetchMenuData(_ latAndLong: LatAndLong) -> AnyPublisher<MenuData?, Never> {
        let latitude = latAndLong.0
        let longitude = latAndLong.1
        return menuManager
            .fetchMenu(latitude: latitude, longitude: longitude)
            .eraseToAnyPublisher()
            .catch { [weak self] error  in
                self?.error = error
                let errorResponse = MenuResponse(status: "No Data", code: nil, data: nil)
                return Just(errorResponse)
            }
            .map({ $0.data })
            .eraseToAnyPublisher()
    }
}
