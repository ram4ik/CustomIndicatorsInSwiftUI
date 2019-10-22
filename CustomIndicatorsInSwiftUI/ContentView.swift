//
//  ContentView.swift
//  CustomIndicatorsInSwiftUI
//
//  Created by ramil on 22.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    
    var body: some View {
        ZStack {
            // Main view...
            
            NavigationView {
                List(0..<10) {_ in
                    Text("SwiftUI")
                }.navigationBarTitle("Home")
                    .navigationBarItems(trailing: Button(action: {
                        self.show.toggle()
                    }, label: {
                        Text("Show")
                    }))
            }.blur(radius: self.show ? 15 : 0)
            
            // loading view...
            if show {
                Loading()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Loading: View {
    
    var body: some View {
        ZStack {
            
            BlurView()
            
            VStack {
                Indicator()
                Text("Please wait")
                    .foregroundColor(.white)
                    .padding(.top, 8)
            }
        }.frame(width: 110, height: 110)
        .cornerRadius(8)
    }
}

struct BlurView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIVisualEffectView {
        
        let effect = UIBlurEffect(style: .systemMaterialDark)
        let view = UIVisualEffectView(effect: effect)
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<BlurView>) {
            
    }
}

struct Indicator: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor.white
        indi.startAnimating()
        return indi
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        
    }
}
