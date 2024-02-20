//
//  AdministrationPanelView.swift
//  MixtosClub
//
//  Created by Cristian Bahamondes on 12-02-24.
//

import Foundation
import UIKit

protocol AdministrationPanelViewDelegate: AnyObject {
    func adminPanel()
}

class AdministrationPanelView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: AdministrationPanelViewDelegate?
    
    private lazy var adminLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.adminPanel
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var adminPanel: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: UIImage(named: "admin2"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        
        let label = UILabel(frame: CGRect(x: 10, y: 70, width: 80, height: 20))
        label.text = "Admin"
        label.textAlignment = .center
        
        button.addSubview(imageView)
        button.addSubview(label)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.purple.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapAdminPanel), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

extension AdministrationPanelView {
    
    private func buildViewHierarchy() {
        [adminLabel, adminPanel].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            adminLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            adminLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            adminPanel.topAnchor.constraint(equalTo: adminLabel.bottomAnchor, constant: 30),
            adminPanel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            adminPanel.widthAnchor.constraint(equalToConstant: 110),
            adminPanel.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
}

extension AdministrationPanelView {
    @objc
    func didTapAdminPanel() {
        delegate?.adminPanel()
    }
}
