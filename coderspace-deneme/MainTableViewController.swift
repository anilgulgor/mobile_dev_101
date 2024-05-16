//
//  MainTableViewController.swift
//  coderspace-deneme
//
//  Created by ANIL GULGOR on 6.05.2024.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        // navigation bar
        
        self.setupNavBar();
        self.registerTableViewCell();
        self.setTableViewAppearance()
        
        tableView.dataSource = self

        NetworkManager.shared.get(endpoint: "http://localhost:3000/movies") { data, response , error in
            guard let data = data else {
                print("No data:", error ?? "Unknown error")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let moviesResponse = try decoder.decode(MoviesResponse.self, from: data)
                self.movies = moviesResponse.movies
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Failed to decode JSON:", error)
            }
        }
    }
    
    func setupNavBar() {
        self.navigationItem.title = "Coderspace";
        
        
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white];
        navbarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white];
        navbarAppearance.backgroundColor = UIColor.black;
        
        self.navigationController?.navigationBar.prefersLargeTitles = true;
        self.navigationController?.navigationBar.isTranslucent = false;
        
        self.navigationController?.navigationBar.standardAppearance = navbarAppearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance;
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        
    }
    
    
    // MARK: - Table view register operations for custom cell
    func registerTableViewCell() {
        self.tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell");
    }
    
    // MARK: - Table view appearance
    func setTableViewAppearance() {
        self.tableView.backgroundColor = .black;
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movies.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell
        
        if ((cell) != nil) {
            cell?.movieTitle.text = self.movies[indexPath.row].title;
            cell?.yearTitle.text = "\(self.movies[indexPath.row].year)";
            cell?.directorTitle.text = self.movies[indexPath.row].director;
            cell?.imageWebView.load(URLRequest(url: URL(string: self.movies[indexPath.row].coverImageUrl)!));
            
            return cell ?? UITableViewCell();
        }
        
        
        return UITableViewCell();
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160;
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
