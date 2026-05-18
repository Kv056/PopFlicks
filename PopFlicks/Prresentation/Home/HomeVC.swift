//
//  HomeVC.swift
//  PopFlicks
//
//  Created by Phycom on 18/05/26.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tblView: UITableView!
    
    
    //MARK: Variable
    var movieList:ModelPopularMovie?
    
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchMovies()
    }
    
    //MARK: setpUI
    private func setupTableView() {
        let nib = UINib(nibName: "MovieListCell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "MovieListCell")
    }
    
    @MainActor
    func fetchMovies(){
        Task {
            do {
                movieList = try await APIClient()
                    .request(
                        MovieListEndpoint.PopularMovies,
                        responseType:
                            ModelPopularMovie.self
                    ) 
                tblView.reloadData()
            } catch {
                print(error)
            }
        }
    }
}


extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as? MovieListCell)!
        
        if let list = movieList{
            cell.configureCell(movieData: list.results[indexPath.row])
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.movieID = 1
        self.present(detailVC, animated: true)
    }
    
    
    
    
}
