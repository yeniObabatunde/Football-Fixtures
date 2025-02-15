//
//  BaseViewController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var loaderView: UIActivityIndicatorView?
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        bindViewModel()
    }
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        if let scrollView = view as? UIScrollView {
            scrollView.refreshControl = refreshControl
        }
    }
    
    @objc private func handleRefresh() {
        refreshData()
    }
    
    func refreshData() {
        refreshControl.endRefreshing()
    }
    
    func showLoader(_ show: Bool) {
        if show {
            if loaderView == nil {
                let loader = UIActivityIndicatorView(style: .large)
                loader.center = view.center
                loader.hidesWhenStopped = true
                loader.color = .gray
                view.addSubview(loader)
                loaderView = loader
            }
            loaderView?.startAnimating()
        } else {
            loaderView?.stopAnimating()
        }
    }
    
    func showError(message: String, title: String = "Error") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    func bindViewModel() {}
}
