//
//  ReposGitUsersByLanguageListCell.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit

class ReposGitUsersByLanguageListCell: UITableViewCell {
        
    //MARK: - Components
    private let avatarImageView: UIImageView = {
        let imv = UIImageView()
        imv.layer.cornerRadius = 55
        imv.clipsToBounds = true
        imv.layer.borderWidth = 4
        imv.layer.borderColor = UIColor.gray.cgColor
        return imv
    }()
    
    private lazy var contentsStackView: UIStackView = {
        let v = UIStackView(
            arrangedSubviews:
                [
                    nameLabel,
                    repoLabel,
                    UIStackView(
                        spacing: 10,
                        arrangedSubviews:
                            [
                                starImageView,
                                starCountLabel
                            ]
                        ,
                        alignment: .center)
                ]
        )
        v.axis = .vertical
        v.alignment = .leading
        v.spacing = 8
        return v
    }()
    
    private let nameLabel = UILabel(font: UIFont().mainFontApp(size: 12), textColor: UIColor.black)
    private let repoLabel = UILabel(font: UIFont().mainFontApp(size: 12), textColor: UIColor.black)
    private let starCountLabel = UILabel(font: UIFont().mainFontApp(size: 12), textColor: UIColor.black)

    private let starImageView: UIImageView = {
        let v = UIImageView(image: UIImage(named: "star"))
        v.heightAnchor.constraint(equalToConstant: 25).isActive = true
        v.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return v
    }()
    
    private let lineDivider: UIView = {
        let v = UIView()
        v.backgroundColor = .newGray
        return v
    }()
    
    //MARK: - Variables
    static let reuseIdentifier = "ReposGitUsersByLanguageListCell"

    public var reposContents: String? {
        didSet {
            setupView()
            setupContents()
        }
    }

    //MARK: - Custom Methods
    
    private func setupContents() {
        //imgview.loadSDWebImage(imageView: imgview, string: item.owner.avatarUrl)
        avatarImageView.image = UIImage(named: "star")
        nameLabel.text = "Name: VSouza" //\(item.owner.login)"
        repoLabel.text = "Repo: tRxSwiftXX " //\(item.name)"
        starCountLabel.text = "33322" //"\(item.stargazers_count)"
    }
    
//    func setupCell(item: Items){
//
//        imgview.loadSDWebImage(imageView: imgview, string: item.owner.avatarUrl)
//        labelName.text = "Name: \(item.owner.login)"
//        labelRepo.text = "Repo: \(item.name)"
//        labelStarCount.text = "\(item.stargazers_count)"
//
//    }
    
}

//MARK: - Auto Layout
extension ReposGitUsersByLanguageListCell {
    private func setupView() {
        buildHierarquie()
        setupConstraints()
    }
    
    private func buildHierarquie() {
        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(lineDivider)
        self.contentView.addSubview(contentsStackView)
    }
    
    private func setupConstraints() {
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            avatarImageView.heightAnchor.constraint(equalToConstant: 115),
            avatarImageView.widthAnchor.constraint(equalToConstant: 115)
        ])
        
        lineDivider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineDivider.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 0),
            lineDivider.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
            lineDivider.widthAnchor.constraint(equalToConstant: 1),
            lineDivider.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 0)
        ])

        contentsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentsStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            contentsStackView.leadingAnchor.constraint(equalTo: lineDivider.trailingAnchor, constant: 25),
            contentsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
//        starImageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            starImageView.topAnchor.constraint(equalTo: repoLabel.bottomAnchor, constant: 10),
//            starImageView.leadingAnchor.constraint(equalTo: lineDivider.trailingAnchor, constant: 10),
//            starImageView.heightAnchor.constraint(equalToConstant: 30),
//            starImageView.widthAnchor.constraint(equalToConstant: 30)
//        ])
//
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
//            nameLabel.leadingAnchor.constraint(equalTo: lineDivider.trailingAnchor, constant: 10),
//            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            nameLabel.heightAnchor.constraint(equalToConstant: 22)
//        ])
//
//        repoLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            repoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
//            repoLabel.leadingAnchor.constraint(equalTo: lineDivider.trailingAnchor, constant: 10),
//            repoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
//            repoLabel.heightAnchor.constraint(equalToConstant: 22)
//        ])
//
//        starCountLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            starCountLabel.topAnchor.constraint(equalTo: repoLabel.bottomAnchor, constant: 16),
//            starCountLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 8),
//            starCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            starCountLabel.heightAnchor.constraint(equalToConstant: 22)
//        ])
    }
}

//MARK: - Private Extensions
private extension UILabel {
    convenience init(text: String = "", font: UIFont = UIFont().mainFontApp(size: 12), textColor: UIColor = UIColor.black, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}

private extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .horizontal, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0, arrangedSubviews: [UIView] = [], isHidden: Bool = false, alignment: UIStackView.Alignment = .fill) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        self.isHidden = isHidden
        self.alignment = alignment
    }
}
