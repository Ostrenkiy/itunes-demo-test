//
//  ViewController.swift
//  itunes-demo-test
//
//  Created by Ostrenkiy on 12.07.2020.
//  Copyright © 2020 Ostrenkiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var tracks: [Track] = []
    var tracksAPI: TracksAPI = TracksAPI()
    var query = ""
    var cancellationToken: CancellationToken?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        searchBar.delegate = self
        refresh()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TrackTableViewCell", bundle: nil), forCellReuseIdentifier: "TrackTableViewCell")
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
    }
    
    func refresh() {
        cancellationToken?()
        cancellationToken = tracksAPI.getTracks(query: query) { [weak self] tracks in
            self?.tracks = tracks
            self?.tableView.reloadData()
        }
    }
    
    func queryChanged(query: String) {
        self.query = query
        refresh()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrackTableViewCell", for: indexPath) as? TrackTableViewCell else {
            return UITableViewCell()
        }
        cell.setupWith(track: tracks[indexPath.row])
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        queryChanged(query: searchText)
    }
}

