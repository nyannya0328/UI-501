//
//  Home.swift
//  UI-501
//
//  Created by nyannyan0328 on 2022/03/11.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab : Trip = trips[0]
    var body: some View {
        ZStack{
            
            
            GeometryReader{proxy in
                
                
                let size = proxy.size
                
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:size.width , height: size.height)
                
            }
            
            VStack(spacing:9){
                
                
                Text("Lets Go With")
                    .font(.title)
                    .foregroundColor(.white)
                Text("Proco Trip")
                    .font(.largeTitle.weight(.black))
                    .foregroundColor(.white)
                
                
                VStack {
                    GeometryReader{proxy in
                        
                        let size = proxy.size
                        TabView(selection: $selectedTab) {
                            
                            
                            
                            ForEach(trips){trip in
                                
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width:size.width - 23 , height: size.height)
                                    .tag(trip)
                                    .cornerRadius(10)
                            }
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    
                    Text(selectedTab.title)
                        .font(.title.weight(.black))
                        .foregroundColor(.black)
                        .padding(.top,20)
                        .padding(.bottom,50)
                    
                    
                    HStack{
                        
                        ForEach(trips.indices,id:\.self){index in
                            
                            Circle()
                                .fill(getIndex() == index ? .black : .white)
                                .frame(width: 10, height: 10)
                                .scaleEffect(getIndex() == index ? 2 : 1)
                                .animation(.easeInOut, value: getIndex())
                                .shadow(radius: 5)
                            
                        }
                        
                    }
                    
                    
                }
              
                .padding(.top,20)
                .padding(.horizontal)
                .background(Color.white
                    .clipShape(CustomShape())
                )
                .padding(.horizontal)
                
                Button {
                    
                } label: {
                    
                    Text("Get Started")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .frame(maxWidth:.infinity)
                        .background(
                            
                            
                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                .fill(Color("blue"))
                        
                        
                        )
                }
                .padding(.horizontal)
                .padding(.top,30)
                
                
             
                
            }
           
            
            
        }
        .ignoresSafeArea()
    }
    
    
    
    func getIndex()->Int{
        
        return trips.firstIndex { cuurentTrip in
            
            selectedTab.id == cuurentTrip.id
        } ?? 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct PageController : UIViewRepresentable{
    
    
    var maxPage : Int
    var currentPage : Int
    
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let controller = UIPageControl()
        controller.currentPageIndicatorTintColor = .red
        controller.pageIndicatorTintColor = .green
        controller.currentPage = currentPage
        controller.numberOfPages = maxPage
       
        return controller
        
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        uiView.currentPage = currentPage
    }
}


struct CustomShape : Shape{
    
    func path(in rect: CGRect) -> Path {
        
        return Path {path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            let midWidth = rect.width / 2
            
            path.addLine(to: CGPoint(x: midWidth - 80, y: rect.height))
            path.addLine(to: CGPoint(x: midWidth - 70, y: rect.height - 25))
            path.addLine(to: CGPoint(x: midWidth + 80, y: rect.height - 25))
            
            
            path.addLine(to: CGPoint(x: midWidth + 80 ,y: rect.height))
            path.addLine(to: CGPoint(x: rect.width ,y: rect.height))
            path.addLine(to: CGPoint(x: rect.width ,y: 0))
            
            
            
            
            
        }
    }
}
