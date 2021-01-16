//
//  ContentView.swift
//  HomeWork7
//
//  Created by MAC on 11.01.2021.
//  Copyright © 2021 MAC. All rights reserved.
//

import SwiftUI
import SystemConfiguration

// Test screen
struct ContentView: View {

    private let reachability = SCNetworkReachabilityCreateWithName(nil, "www.app.com")


    @State private var showSheet = false
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Checking Internet Status")
            }
            .navigationBarTitle("Internet Checker")
            .navigationBarItems(trailing:
                Button(action: {
                    print("Add Button Pressed")
                    var flags = SCNetworkReachabilityFlags()
                    SCNetworkReachabilityGetFlags(self.reachability!, &flags)

                    if self.isNetworkReachable(with: flags) {
                        self.showSheet = true
                    } else {
                        self.showAlert = true
                    }
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                }
            )
        }
        .sheet(isPresented: self.$showSheet) {
            Text("Do Something On Internet")
        }
        .alert(isPresented: self.$showAlert, content: {
            Alert(title: Text("No internet Connection"), message: Text("Please enable Wifi or Cellular Data"), dismissButton: .default(Text("OK")))
        })
    }

    private func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        return isReachable && (!needsConnection || canConnectWithoutInteraction)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
