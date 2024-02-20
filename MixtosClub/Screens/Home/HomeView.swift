//
//  HomeView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 06-02-24.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func tapFirstMatch()
    func goAdminPanel()
}

class HomeView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: HomeViewDelegate?
    private var kindUser: String
    private var activeSecondaryMatches: Bool
    private var numberOfViews: Int
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.titleHome
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.isDirectionalLockEnabled = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var mainView: MainMatchesView = {
        let view = MainMatchesView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondaryView: SecondaryMatchesView = {
        let view = SecondaryMatchesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var informativeView: InformativeSectionView = {
        let view = InformativeSectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var administrationView: AdministrationPanelView = {
        let view = AdministrationPanelView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
 
    init(kindUser: String, activeSecondaryMatches: Bool, numberOfViews: Int = 3) {
        self.kindUser = kindUser
        self.activeSecondaryMatches = activeSecondaryMatches
        self.numberOfViews = numberOfViews
        super.init(frame: .zero)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func kindMultiplier(activate: Bool) -> CGFloat {
        if activate  && numberOfViews > 4 {
            let sizeScreen = UIScreen.main.bounds.width
            
            if sizeScreen > 380 {
                return 1
            } else {
                return 1.5
            }
        } else {
            return 0
        }
    }
}

extension HomeView {
    
    private func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(mainView)
        contentView.addSubview(informativeView)
        if activeSecondaryMatches {
            contentView.addSubview(secondaryView)
            numberOfViews = 4
        }
        if kindUser == kindUserType.admin.rawValue {
            contentView.addSubview(administrationView)
            numberOfViews = 5
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: kindMultiplier(activate: activeSecondaryMatches)),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            mainView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 175),
            
            //informativeView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 10),
            informativeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            informativeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            informativeView.heightAnchor.constraint(equalToConstant: 175)
        ])
        
        if activeSecondaryMatches {
            NSLayoutConstraint.activate([
                
                secondaryView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 10),
                secondaryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                secondaryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                secondaryView.heightAnchor.constraint(equalToConstant: 155),
                
                informativeView.topAnchor.constraint(equalTo: secondaryView.bottomAnchor, constant: 10)
                
            ])
        } else {
            NSLayoutConstraint.activate([
                informativeView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 10)
            ])
        }
        
        if kindUser == kindUserType.admin.rawValue {
            NSLayoutConstraint.activate([
                
                administrationView.topAnchor.constraint(equalTo: informativeView.bottomAnchor, constant: 10),
                administrationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                administrationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                administrationView.heightAnchor.constraint(equalToConstant: 175)
                
            ])
        }
    }
}

extension HomeView {
    @objc
    func didTapThirdMatch() {
        print("presione boton 3")
    }
    
    @objc
    func didTapPastMatches() {
        print("presione boton 4")
    }
    
    @objc
    func didTapFinances() {
        print("presione boton 5")
    }
    
    @objc
    func didTapAdminPanel() {
        print("presione boton 6")
    }
}

extension HomeView: MainMatchesViewDelegate {
    func tapFirstMatch() {
        delegate?.tapFirstMatch()
    }
}

extension HomeView: AdministrationPanelViewDelegate {
    func adminPanel() {
        delegate?.goAdminPanel()
    }
}
