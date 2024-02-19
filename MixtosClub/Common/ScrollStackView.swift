//
//  ScrollStackView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 12-02-24.
//

import Foundation
import UIKit

class ScrollStackView: UIView {
    
    private let topInset: CGFloat
    private let leftInset: CGFloat
    private let botInset: CGFloat
    private let rightInset: CGFloat
    
    public let scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.isDirectionalLockEnabled = true
        scroll.backgroundColor = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    public let stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        return stack
    }()
    
    public init(topInset: CGFloat = 0,
                leftInset: CGFloat = 0,
                botInset: CGFloat = 0,
                rightInset: CGFloat = 0) {
        self.topInset = topInset
        self.leftInset = leftInset
        self.botInset = botInset
        self.rightInset = rightInset
        super.init(frame: .zero)
        buildViewHierarchy()
    }
    
    public required init (coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScrollStackView {
    public func buildViewHierarchy() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
        scrollView.automaticallyAdjustsScrollIndicatorInsets = true
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: topInset),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leftInset),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: rightInset),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: botInset),
            stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (leftInset + rightInset))
        ])
    }
}
