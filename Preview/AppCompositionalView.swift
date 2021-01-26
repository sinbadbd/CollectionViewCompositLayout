//
//  AppView.swift
//  CollectionViewCompositLayout
//
//  Created by Imran on 26/1/21.
//

import SwiftUI


struct AppView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AppView>) -> UIViewController {
        let redController = UIViewController()
        redController.view.backgroundColor = .red
        
        return redController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<AppView>) {
        
    }
    
}


struct AppCompositionalView: View {
    var body: some View {
        AppView()
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppCompositionalView()
    }
}
