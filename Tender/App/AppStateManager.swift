//
//  AppStateManager.swift
//  Tender
//
//  Created by Rajanish Karki on 6/22/22.
//

import Foundation

class AppStateManager: ObservableObject{
    
    @Published var selectedTab: TabBarButtonType = .person
//    @Published var selectedPromo: ProfilePromoType = .platinum
    
    @Published var showPersonProfile: Person? = nil
    
    @Published var showPurchasePopup: Bool = false
    
    @Published var isFullScreenMode: Bool = false
    
    public func showPersonProfile(_ person: Person){
        self.showPersonProfile = person
    }
    
    public func showPurchaseScreen(){
        self.showPurchasePopup = true
    }
}
