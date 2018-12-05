//
//  TodayViewController.swift
//  KusaTodayExtension
//
//  Created by isaoeka on 2018/12/05.
//  Copyright © 2018 isaoeka. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        self.initView()
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}

extension TodayViewController {
    private func initView() {
        let nib = UINib(nibName: "SquareCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "SquareCell")
        self.collectionView.backgroundColor = .clear
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout().apply {
            $0.scrollDirection = .horizontal
            $0.minimumInteritemSpacing = 1
            $0.minimumLineSpacing = 1

            let rect = self.collectionView.bounds
            let width = rect.width / (364 / 7) - $0.minimumInteritemSpacing
            let height = rect.height / 7 - $0.minimumLineSpacing
            $0.itemSize = CGSize(width: width, height: height)
        }

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension TodayViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 365
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SquareCell", for: indexPath) as! SquareCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

}
