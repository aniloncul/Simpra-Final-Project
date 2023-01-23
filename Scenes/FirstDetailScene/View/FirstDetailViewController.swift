//
//  FirstDetailViewController.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 19.01.2023.
//

import UIKit
import Kingfisher

final class FirstDetailViewController: UIViewController {
    
    //MARK: - Properties
    var item: Game?
    private let viewModel = FirstViewModel()
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!

    @IBOutlet weak var detailCollectionView: UICollectionView!{
        didSet{
            detailCollectionView.delegate = self
            detailCollectionView.dataSource = self
            
            detailCollectionView.register(UINib(nibName:"FirstDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FirstDetailCollectionViewCell")
        }
    }
    
  
    
   
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.text = item?.name
        dateLabel.text = item?.released
         
    }

   
}

//MARK: - Extensions

extension FirstDetailViewController: FirstViewModelDelegate {
    func didFetchScreenshots(id: String) {
        detailCollectionView.reloadData()
    }
    
    func didErrorOccured(_ error: Error) {
        print(error)
    }
    
    func didFetchGames() {
        
    }
    
    
}

extension FirstDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.detailNumberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstDetailCollectionViewCell", for: indexPath) as? FirstDetailCollectionViewCell else {fatalError("ProductsCollectionViewCell not found")}
        
        let rlu = "https://media.rawg.io/media/screenshots/cf4/cf4367daf6a1e33684bf19adb02d16d6.jpg"
        let url = URL(string: rlu)
        cell.imageView.kf.setImage(with: url)
        
        return cell
    }
    
    
}

extension FirstDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .screenWidth - 7.0, height: .screenWidth - 7.0)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            1
        }
    
    
    
}

extension FirstDetailViewController: UICollectionViewDelegate {
    
}


