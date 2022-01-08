//
//  BaseViewController.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import UIKit

open class BaseViewController<C>: UIViewController, Coordinable {
    public let coordinator: C

    public required init(coordinator: C) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        self.configure()
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configure() {
    }
    
    override open func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationItem.largeTitleDisplayMode = .never
        }
    }

    override open var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

