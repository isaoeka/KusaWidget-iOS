//
//  TodayViewController.swift
//  KusaTodayExtension
//
//  Created by isaoeka on 2018/12/05.
//  Copyright © 2018 isaoeka. All rights reserved.
//

import UIKit
import NotificationCenter


struct DayEntity: Codable {
    var value: Int
}

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private lazy var dayList: [DayEntity] = try! JSONDecoder().decode([DayEntity].self, from: jsonData)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        let _ = self.dayList // init lazy
        self.initView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.updateFlowlayout()
        self.collectionView.reloadData()
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
        self.collectionView.isScrollEnabled = false
        self.collectionView.backgroundColor = .clear
        
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout().apply {
            $0.scrollDirection = .horizontal
            $0.minimumInteritemSpacing = 1
            $0.minimumLineSpacing = 1
        }

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    private func updateFlowlayout() {
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let viewRect = self.collectionView.bounds
            let columnCount: CGFloat = 7
            let rowCount: CGFloat = (364 / columnCount)
            let size: CGFloat = (viewRect.width - layout.minimumInteritemSpacing) / rowCount
            layout.itemSize = CGSize(width: size, height: size)
            
            let cellsHeight = (size + layout.minimumLineSpacing) * columnCount
            let topPadding = (viewRect.height - cellsHeight) / 2
            let leftPadding: CGFloat = 0
            layout.sectionInset = UIEdgeInsets(
                top: topPadding,
                left: leftPadding,
                bottom: topPadding,
                right: leftPadding
            )
        }
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension TodayViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 364
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SquareCell", for: indexPath) as! SquareCell
        cell.dayNum = indexPath.row + 1
        
        if self.dayList.count > indexPath.row {
            cell.value = self.dayList[indexPath.row].value
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

}
