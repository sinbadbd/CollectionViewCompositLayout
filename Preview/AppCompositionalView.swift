//
//  AppView.swift
//  CollectionViewCompositLayout
//
//  Created by Imran on 26/1/21.
//

import SwiftUI
//import UIKit

class CompositionalController : UICollectionViewController {
    
    
    init() {

        
        let layout = UICollectionViewCompositionalLayout {
            (sectionNumber, _) -> NSCollectionLayoutSection? in
       
            if sectionNumber == 0 {
                return CompositionalController.topSection()
            }else if sectionNumber == 1{
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)))
                item.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 16)
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets.leading = 16
                return section
            }else {
                return CompositionalController.topSection()
            }
        }
        
        super.init(collectionViewLayout: layout)
 
    }
    
    static func topSection()-> NSCollectionLayoutSection {
        

        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.bottom = 16
        item.contentInsets.trailing = 16
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(270)), subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.leading = 16
        return section

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(300)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.leading = 32
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "Apps"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "small")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

      
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .red
            return cell
        
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "small", for: indexPath)

            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .green
            return cell
        }
    }
    
    
}



struct AppView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AppView>) -> UIViewController {
        let vc = CompositionalController()
        return vc
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
            .edgesIgnoringSafeArea(.all)
    }
}
