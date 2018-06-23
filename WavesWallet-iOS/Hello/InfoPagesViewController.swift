//
//  InfoPagesViewController.swift
//  WavesWallet-iOS
//
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import UIKit
import Koloda

class InfoPagesViewController: UIViewController, KolodaViewDelegate, KolodaViewDataSource {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var kolodaView: KolodaView!
    @IBOutlet weak var kolodaTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var kolodaBotConstraint: NSLayoutConstraint!
    @IBOutlet weak var pageControlBotConstraint: NSLayoutConstraint!
    
    var pageViews: [UIView] {
        
        let firstView = Bundle.main.loadNibNamed("FirstInfoPageView", owner: nil, options: nil)?.first as! FirstInfoPageView
        let secondView = Bundle.main.loadNibNamed("SecondInfoPageView", owner: nil, options: nil)?.first as! SecondInfoPageView
        let thirdView = Bundle.main.loadNibNamed("ThirdIndoPageView", owner: nil, options: nil)?.first as! ThirdIndoPageView
        let fourthView = Bundle.main.loadNibNamed("FourthInfoPageView", owner: nil, options: nil)?.first as! FourthInfoPageView
        let fifthView = Bundle.main.loadNibNamed("FifthInfoPageView", owner: nil, options: nil)?.first as! FifthInfoPageView
        let sixthView = Bundle.main.loadNibNamed("SixthInfoPageView", owner: nil, options: nil)?.first as! SixthInfoPageView
        let seventhView = Bundle.main.loadNibNamed("SeventhInfoPageView", owner: nil, options: nil)?.first as! SeventhInfoPageView
        
        firstView.nextBtn.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        secondView.nextBtn.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        thirdView.nextBtn.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        fourthView.nextBtn.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        fifthView.nextBtn.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        sixthView.nextBtn.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        seventhView.nextBtn.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        
        firstView.setupConstraints()
        secondView.setupConstraints()
        thirdView.setupConstraints()
        fourthView.setupConstraints()
        fifthView.setupConstraints()
        sixthView.setupConstraints()
        seventhView.setupConstraints()

        return [firstView, secondView, thirdView, fourthView, fifthView, sixthView, seventhView]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }
    
    private func setupConstraints() {
        if Platform.isIphone5 {
            kolodaTopConstraint.constant = 44
            kolodaBotConstraint.constant = 34
            pageControlBotConstraint.constant = 14
        }
        else if Platform.isIphoneX || Platform.isIphonePlus {
            kolodaTopConstraint.constant = 84
            kolodaBotConstraint.constant = 54
            pageControlBotConstraint.constant = 24
        }
        else {
            kolodaTopConstraint.constant = 44
            kolodaBotConstraint.constant = 54
            pageControlBotConstraint.constant = 24
        }
    }
    
    private func setupUI() {
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
        kolodaView.countOfVisibleCards = 4
        kolodaView.resetCurrentCardIndex()
        pageControl.numberOfPages = kolodaView.countOfCards
        pageControl.currentPage = kolodaView.currentCardIndex
    }
    
    @objc func changePage() {
        kolodaView.swipe(.left)
        pageControl.currentPage = kolodaView.currentCardIndex
    }
    
    //MARK: - KolodaViewDelegate, KolodaViewDataSource
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return pageViews[index]
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return pageViews.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.resetCurrentCardIndex()
    }
    
    func kolodaShouldApplyAppearAnimation(_ koloda: KolodaView) -> Bool {
        return true
    }
    
    func koloda(_ koloda: KolodaView, shouldDragCardAt index: Int) -> Bool {
        return false
    }
}