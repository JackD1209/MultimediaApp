//
//  OnNowViewController.swift
//  MultimediaApp
//
//  Created by Doan Minh Hoang on 2/19/20.
//  Copyright © 2020 Doan Minh Hoang. All rights reserved.
//

import UIKit

class OnNowViewController: UIViewController {
    @IBOutlet weak var nowPlayingView: UIView!
    @IBOutlet weak var nowPlayingImageView: UIImageView!
    @IBOutlet weak var nowPlayingChannelImageView: UIImageView!
    @IBOutlet weak var nowPlayingTitleLabel: UILabel!
    @IBOutlet weak var nowPlayingSubTitleLabel: UILabel!
    @IBOutlet weak var onNowTableView: UITableView!
    @IBOutlet weak var eventCollectionView: UICollectionView!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var channelSelectedImageView: UIImageView!
    @IBOutlet weak var eventSelectedImageView: UIImageView!
    @IBOutlet weak var nowPlayingHeightConstraint: NSLayoutConstraint!
    
    var lastContentOffset: CGFloat = 0
    var maxNowPlayingConstraint: CGFloat = 0
    var minNowPlayingConstraint: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nowPlayingView.dropShadow()
        maxNowPlayingConstraint = nowPlayingHeightConstraint.constant
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func playButtonClicked(_ sender: Any) {
    }
    
    @IBAction func channelButtonClicked(_ sender: Any) {
        channelSelectedImageView.isHidden = false
        eventSelectedImageView.isHidden = true
        
        channelLabel.textColor = UIColor.white.withAlphaComponent(1)
        eventLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        
        onNowTableView.isHidden = false
        eventCollectionView.isHidden = true
    }
    
    @IBAction func eventButtonClicked(_ sender: Any) {
        channelSelectedImageView.isHidden = true
        eventSelectedImageView.isHidden = false
        
        channelLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        eventLabel.textColor = UIColor.white.withAlphaComponent(1)
        
        onNowTableView.isHidden = true
        eventCollectionView.isHidden = false
    }
}

extension OnNowViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OnNowTableViewCell", for: indexPath) as! OnNowTableViewCell
        cell.onNowBackgroundView.roundCorners(corners: [.topLeft, .bottomLeft])
        
        return cell
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            if nowPlayingHeightConstraint.constant > minNowPlayingConstraint {
                nowPlayingHeightConstraint.constant -= 1
            }
        } else if self.lastContentOffset > scrollView.contentOffset.y {
            if nowPlayingHeightConstraint.constant < maxNowPlayingConstraint {
                nowPlayingHeightConstraint.constant += 1
            }
        } else {
            // didn't move
        }
    }
}

extension OnNowViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 239, height: 288)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnNowEventCollectionViewCell", for: indexPath) as! OnNowEventCollectionViewCell
        cell.roundCorners(corners: .allCorners)
        return cell
    }
}

class OnNowTableViewCell: UITableViewCell {
    @IBOutlet weak var onNowBackgroundView: UIView!
    @IBOutlet weak var favouriteImageView: UIImageView!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var onNowCollectionView: UICollectionView!
    
    @IBAction func favouriteButtonClicked(_ sender: Any) {
        favouriteImageView.image = favouriteImageView.image == UIImage(systemName: "heart") ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    }
}

extension OnNowTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnNowCollectionViewCell", for: indexPath) as! OnNowCollectionViewCell
        return cell
    }
}

class OnNowCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var videoProcessView: UIProgressView!
    @IBOutlet weak var videoTimerLabel: UILabel!
    @IBOutlet weak var watchingLabel: UILabel!
}

class OnNowEventCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventProcessView: UIProgressView!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventSubTitleLabel: UILabel!
    @IBOutlet weak var playEventButton: UIImageView!
    @IBOutlet weak var watchingView: UIView!
    @IBOutlet weak var liveView: UIView!
    
    @IBAction func playEventButtonClicked(_ sender: Any) {
    }
}
