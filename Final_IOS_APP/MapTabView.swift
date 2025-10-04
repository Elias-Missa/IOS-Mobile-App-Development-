import SwiftUI
import MapKit

struct MapTabView: View {
    @State private var showPOI = true
    @State private var mapTypeIndex = 0 // 0=standard, 1=hybrid, 2=satellite

    var body: some View {
        VStack(spacing: 12) {
            // Optional: map type control like the book chapter
            Picker("Map Type", selection: $mapTypeIndex) {
                Text("Standard").tag(0)
                Text("Hybrid").tag(1)
                Text("Satellite").tag(2)
            }
            .pickerStyle(.segmented)

            // EXACT book requirement: label + switch
            HStack {
                Text("Points of Interest")
                    .font(.headline)
                Spacer()
                Toggle("", isOn: $showPOI)
                    .labelsHidden()
            }
            .padding(.horizontal)

            // Use UIKit's MKMapView so we can set pointOfInterestFilter
            RepresentableMap(showPOI: $showPOI, mapTypeIndex: $mapTypeIndex)
                .ignoresSafeArea(.all, edges: .bottom)
        }
        .padding(.top, 8)
        .navigationTitle("Map")
    }
}

private struct RepresentableMap: UIViewRepresentable {
    @Binding var showPOI: Bool
    @Binding var mapTypeIndex: Int

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: .zero)

        // Default region (UCF area; change if you want)
        let coord = CLLocationCoordinate2D(latitude: 28.6024, longitude: -81.2001)
        map.setRegion(MKCoordinateRegion(
            center: coord,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ), animated: false)

        map.showsCompass = true
        map.pointOfInterestFilter = .includingAll // start ON
        map.mapType = .standard
        return map
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Bronze: toggle POIs
        if #available(iOS 13.0, *) {
            uiView.pointOfInterestFilter = showPOI ? .includingAll : .excludingAll
        }

        switch mapTypeIndex {
        case 0: uiView.mapType = .standard
        case 1: uiView.mapType = .hybrid
        case 2: uiView.mapType = .satellite
        default: break
        }
    }
}
