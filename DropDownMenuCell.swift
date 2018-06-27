/**
	Copyright (C) 2015 Quentin Mathe
 
	Date:  May 2015
	License:  MIT
 */

import UIKit

open class DropDownMenuCell : UITableViewCell {
    
	open var showsCheckmark = true
	open var rowHeight: CGFloat = 60
    
    var titleLabel: UILabel!
    open var selectImageView: UIImageView!
    open var mark: Bool = false {
        didSet {
            guard (selectImageView) != nil else {
                return
            }
            selectImageView.image = mark ? UIImage.init(named: "checked") : UIImage.init(named: "unchecked")
        }
    }
    open var title: String = "" {
        didSet {
            guard let titleLabel = titleLabel else {
                return
            }
            titleLabel.text = title
        }
    }
    
	// MARK: - Initialization
	override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		 fatalError("init(style:reuseIdentifier:) is not supported")
        
	}
	
	public init() {
		super.init(style: .default, reuseIdentifier: NSStringFromClass(DropDownMenuCell.self))
		setupUI()
	}

	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    // MARK: - setupUI
    func setupUI() {
        
        titleLabel = UILabel.init()
        contentView.addSubview(titleLabel)
        
        selectImageView = UIImageView.init(image: UIImage.init(named: "unchecked"))
        contentView.addSubview(selectImageView)
    }
	
	// MARK: - Layout
	open var iconSize = CGSize(width: 24, height: 24)
    
	override open func layoutSubviews() {
        
		super.layoutSubviews()
        
        guard (selectImageView) != nil else {
            return
        }
        selectImageView.frame.origin.x = 14
        selectImageView.frame.size.height = 20
        selectImageView.frame.size.width = 20
        selectImageView.center.y = contentView.center.y
        
        guard let titleLabel = titleLabel else {
            return
        }
        let maxX: CGFloat = selectImageView.frame.maxX
        titleLabel.frame.origin.x = maxX + 15
        titleLabel.frame.size.height = 40;
        titleLabel.frame.size.width = 200;
        titleLabel.center.y = contentView.center.y
        
        
	}
}
