//
//  ViewController.swift
//  CollectionViewCompositLayout
//
//  Created by Imran on 25/1/21.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {

    let collectionView : UICollectionView = {
//         let flowLayout = UICollectionViewFlowLayout()
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.bottom = 20
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalHeight(0.5), heightDimension: .absolute(50)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        
        let flowLayout = UICollectionViewCompositionalLayout(section: section)
        
//        flowLayout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collection
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.backgroundColor = .red
        view.addSubview(collectionView)
//        collectionView
//        collectionView
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.fillSuperview()
      // collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        collectionView.backgroundColor = .white
        collectionView.register(CompositeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }


}

@available(iOS 13.0, *)
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CompositeCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
//
    
}
