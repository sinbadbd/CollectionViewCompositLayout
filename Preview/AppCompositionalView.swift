//
//  AppView.swift
//  CollectionViewCompositLayout
//
//  Created by Imran on 26/1/21.
//

import SwiftUI
//import UIKit

class CompositionalController : UICollectionViewController {
    let headerId = "header"
    
    init() {

        
        let layout = UICollectionViewCompositionalLayout {
            (sectionNumber, _) -> NSCollectionLayoutSection? in
       
            if sectionNumber == 0 {
                return CompositionalController.topSection()
            }else{
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)))
                item.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 16)
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets.leading = 16
                
                let kind = UICollectionView.elementKindSectionHeader
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: kind, alignment: .topLeading)
                ]
                
                
                return section
            }
//            else {
//                return CompositionalController.topSection()
//            }
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


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class CollectionViewHeader: UICollectionReusableView {
        let title = UILabel(text: "Apps Group Title", font: UIFont.systemFont(ofSize: 30), numberOfLines: 1)
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(title)
            title.fillSuperview()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "Apps"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: "small")
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
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
        
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "small", for: indexPath)
//            cell.backgroundColor = .blue
            return cell
            
//        default:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//            cell.backgroundColor = .green
//            return cell
//
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
