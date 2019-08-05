
import Foundation

protocol CentralWebRequestDispatcher {
    
}

class CentralWebRequestDispatcherImpl: CentralWebRequestDispatcher {
    
    private let securityService: SecurityService!
    
    init(securityService: SecurityService) {
        self.securityService = securityService
    }
    
}
