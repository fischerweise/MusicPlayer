//
//  ViewController.swift
//  MyMusic
//
//  Created by Afraz Siddiqui on 4/3/20.
//  Copyright © 2020 ASN GROUP LLC. All rights reserved.
//

import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    private var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    
    private func configureSongs() {
        songs.append(Song(name: "Abba Lay All Your Love On Me",
                          albumName: "Greatest Hits",
                          artistName: "Abba",
                          imageName: "abba",
                          trackName: "song4"))
        songs.append(Song(name: "Barış Manço - Dere Boyu Kavaklar",
                          albumName: "Sözüm Meclisten Dışarı",
                          artistName: "Barış Manço",
                          imageName: "barış",
                          trackName: "song5"))
        songs.append(Song(name: "Cem Karaca - Resimdeki Gözyaşları",
                          albumName: "Cemaz-ül Evvel",
                          artistName: "Cem Karaca",
                          imageName: "cem",
                          trackName: "song6"))
        songs.append(Song(name: "Cengiz Kurtoğlu - Küllenen Aşk",
                          albumName: "Unutulan",
                          artistName: "Cengiz Kurtoğlu",
                          imageName: "cengiz",
                          trackName: "song7"))
        songs.append(Song(name: "Ludwig van Beethoven - Symphony No. 5 in C Minor op.67",
                          albumName: "Essential Classics",
                          artistName: "Ludwig van Beethoven",
                          imageName: "beethoven",
                          trackName: "song8"))
        songs.append(Song(name: "Sagopa Kajmer - Sürahi",
                          albumName: "Pesimist Orkestra",
                          artistName: "Sagopa Kajmer",
                          imageName: "sagopa",
                          trackName: "song9"))
    }
    
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
