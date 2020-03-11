//
//  ContentView.swift
//  MyFirstApp
//
//  Created by User06 on 2020/3/4.
//  Copyright © 2020 matcha55. All rights reserved.
//
import SwiftUI
struct Leaf: Shape{
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            path.move(to: CGPoint(x: rect.width, y: -50))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height), control: CGPoint(x: rect.width*10/27, y: rect.height*25/70))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: 120), control: CGPoint(x: rect.width*7/20, y: rect.height*13/15))
            path.move(to: CGPoint(x: 140, y: 90))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height), control: CGPoint(x: rect.width*37/30, y: rect.height*2/17))
            path.closeSubpath()
        }
    }
}
struct Tree: Shape{
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            path.move(to: CGPoint(x: 60, y: -50))
            path.addQuadCurve(to: CGPoint(x: 200, y: 500), control: CGPoint(x: rect.width*76/45, y: rect.height*6/50))
            path.addQuadCurve(to: CGPoint(x: 60, y: 520), control: CGPoint(x: rect.width*6/5, y: rect.height*67/5))
            path.closeSubpath()
        }
    }
}
struct ContentView: View {
    var body: some View {
        
        ZStack{
            Image("chess")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity( 0.5)
            Group {
                Leafview(positionX: 70, positionY: 60, rotationDegrees: 50, width: 40)
                Leafview(positionX: 200, positionY: 60, rotationDegrees: 90, width: 50)
                Leafview(positionX: 130, positionY: 200, rotationDegrees: 130, width: 60)
            }
            Tree()
                .fill(Color(red: 100/255, green: 60/255, blue: 80/255))
                .frame(width: 80, height: 60)
                .position(x: 155,y: 210)
            Leaf()
                .fill(Color.red)
                .frame(width: 160, height: 45)
            .position(x: 55,y: 110)
                .rotationEffect(.degrees(40))
            Text("葉與樹幹與棋")
                .foregroundColor(.yellow)
                .bold()
                .font(.largeTitle)
                .background(Color.green)
                .cornerRadius(15.0)
            .rotationEffect(.degrees(45))
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Leafview: View {
    var positionX: CGFloat = 0
    var positionY: CGFloat = 0
    var rotationDegrees: Double = 0
    var width: CGFloat = 0
    var body: some View {
        Leaf()
            .fill(Color(red: 70/255, green: 75/255, blue: 166/255))
            .frame(width: width*7/6, height: width * 9/8)
            .rotationEffect(.degrees(rotationDegrees))
            .position(x: positionX, y:positionY)
            .shadow(color: Color.green.opacity(0.2), radius: 1,x: 5, y: 60)
    }
}
