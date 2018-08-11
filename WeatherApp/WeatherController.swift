//
//  WeatherController.swift
//  WeatherApp
//
//  Created by Adam Thoma-Perry on 8/11/18.
//  Copyright © 2018 Thoma-Perry, Adam. All rights reserved.
//

import UIKit

class WeatherController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var currentTemp: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getWeather() {
        let url = URL(string: "https://api.aerisapi.com/observations/11225?client_id=vKS3dyydQd0PsALU9ixOm&client_secret=rbJkIQ9uWRsPSb0xnJenpILd0Sarjoh5IxbEmlt7")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task : URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }
                if let response = json["response"] as? [String: AnyObject] {
                    if let ob = response["ob"] as? [String: AnyObject] {
                        if let weather = ob["weather"] {
                            print("The weather is \(weather)")
                            DispatchQueue.main.async {
                                self.weatherLabel.text = "The weather is \(weather)"
                            }
                        }
                        if let tempF = ob["tempF"] {
                            print("The temperature is \(tempF)")
                            DispatchQueue.main.async {
                                self.currentTemp.text = "The temperature is \(tempF)"
                            }
                        }
                        if let tempMin6hrF = ob["tempMin6hrF"] {
                            print("The minimum is \(tempMin6hrF)")
                        }
                        if let tempMax6hrF = ob["tempMax6hrF"] {
                            print("The maximum is \(tempMax6hrF)")
                        }
                        if let dateTimeISO = ob["dateTimeISO"] {
                            print("The day is \(dateTimeISO)")
                            DispatchQueue.main.async {
                                self.dayLabel.text = "The day is \(dateTimeISO)"
                            }
                            
                        }
                    }
                }
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
