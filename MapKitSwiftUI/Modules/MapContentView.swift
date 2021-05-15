//
//  MapContentView.swift
//  MapKitSwiftUI
//
//  Created by Andres on 12/05/2021.
//


import SwiftUI
import MapKit

struct MapContentView: View {
    
    //MARK: - Variables locales
    @ObservedObject var viewModel = MapContentViewModel()
    
    @State private var coordinatRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D( latitude: 40.427184, longitude: -3.656888),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack {
                ZStack{
                    HStack{
                        Image(systemName: "text.justify")
                            .font(.title2)
                            .foregroundColor(Color.black)
                        Spacer()
                        Text("Madrid")
                            .font(.title2)
                            .foregroundColor(Color.black)
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .font(.title2)
                            .foregroundColor(Color.black)
                    }
                    .padding(.horizontal, 10)
                }
                Map(coordinateRegion: self.$coordinatRegion,
                    annotationItems: self.viewModel.pois) { location in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude ?? 0,
                                                                     longitude: location.longitude ?? 0)) {
                        VStack{
                            Text(location.name ?? "")
                                .font(.caption2)
                                .fontWeight(.bold)
                            Image(systemName: "star.fill")
                                .font(.title2)
                                .foregroundColor(Color.red)
                                .shadow(radius: 4)
                        }
                    }
                }
                .ignoresSafeArea()
            }
            Spacer()
            CarrouselPoisView(name: "Lugares de Madrid", data: self.viewModel.pois)
                .cornerRadius(10)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .padding(10)
        }
        .onAppear {
            self.viewModel.getDataFromWeb()
        }
        
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapContentView()
    }
}


struct CarrouselPoisView: View {
    
    let name: String
    let data: [MapPoisViewModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            HStack{
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Rectangle()
                    .fill(Color(UIColor.red).opacity(0.3))
                    .frame(width: 50, height: 5)
            }.padding(.bottom, 10)
            
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 16, content: {
                    ForEach(self.data){ info in
                        PoisCard(data: info)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
//                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                })
            })
        })
    }
}

struct PoisCard: View {
    
    let data: MapPoisViewModel
    @ObservedObject var imageLoader = RemoteImageUrl()
    
    init(data: MapPoisViewModel) {
        self.data = data
        self.imageLoader.getImageFromUrl(data.cityImage ?? "")
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack{
                Rectangle().fill(Color.gray.opacity(0.3))
                Image(uiImage: ((self.imageLoader.data.isEmpty ? UIImage(named: "placeholder") : UIImage(data: self.imageLoader.data))!))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .cornerRadius(8)
            .shadow(radius: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            Text(data.name ?? "")
        }
        .lineLimit(1)
    }
}
