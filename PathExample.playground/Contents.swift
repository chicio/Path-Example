//: A UIKit based Playground for presenting user interface

import SwiftUI
import PlaygroundSupport

private struct TitleBackgroundShape: Shape {
    private let path: UIBezierPath
    private let width: CGFloat
    private let height: CGFloat
    
    init(path: UIBezierPath, width: CGFloat, height: CGFloat) {
        self.path = path
        self.width = width
        self.height = height
    }
    
    func path(in rect: CGRect) -> Path {
        return Path(path.cgPath)
            .applying(CGAffineTransform(scaleX: rect.width / width, y: rect.height/height))
    }
}

struct TitleBackground: View {
    private var whitePath: UIBezierPath {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 247, y: 15.79))
        shape.addLine(to: CGPoint(x: 8.72, y: 21))
        shape.addLine(to: CGPoint(x: 2, y: -2.08))
        shape.addLine(to: CGPoint(x: 245.12, y: -3))
        shape.close()
        return shape
    }
    private var purplePath: UIBezierPath {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 245, y: 18.79))
        shape.addLine(to: CGPoint(x: 6.72, y: 24))
        shape.addLine(to: CGPoint(x: 0, y: 0.92))
        shape.addLine(to: CGPoint(x: 243.12, y: 0))
        shape.close()
        return shape
    }
    
    var body: some View {
        ZStack(alignment: Alignment.topLeading) {
            TitleBackgroundShape(path: purplePath, width: 245, height: 18.79)
                .fill(Color("SecondaryColor"))
            TitleBackgroundShape(path: whitePath, width: 245, height: 18.79)
                .fill(Color("TextColor"))
        }
    }
}

struct InspirationaTitle: View {
    var body: some View {
        ZStack {
            Text(LocalizedStringKey("It's event better when you get there!"))
                .foregroundColor(Color("SecondaryColor"))
                .fontWeight(.bold)
                .minimumScaleFactor(0.4)
                .rotationEffect(Angle(degrees: -1.38))
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .padding(.leading, 11)
                .padding(.trailing, 4)
                .padding(.bottom, 3)
        }
        .background(TitleBackground())
    }
}

struct Preview<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        VStack {
            content()
        }
        .padding(100)
        .background(Color.gray)
    }
}

PlaygroundPage.current.setLiveView(Preview(content: {
    InspirationaTitle()
}))
