import SwiftUI

@main
struct Simple_IOS_AppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "questionmark.circle")
                        Text("Quiz")
                    }

                SecondTabView()
                    .tabItem {
                        Image(systemName: "info.circle")
                        Text("Info")
                    }

                MapTabView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
            }
        }
    }
}
