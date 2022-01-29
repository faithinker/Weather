//
//  HomeModel.swift
//  Weather
//
//  Created by 김주협 on 2022/01/29.
//

import UIKit

struct CityInfo: Codable {
    let id: Int?
    /// 도시이름
    let name: String?
    /// 날씨 상태
    let status: String?
    /// 기온
    let temperature: String?
    /// 경도
    let lon: Double?
    /// 위도
    let lat: Double?
    /// 이미지
    var image: UIImage? { // status값에 따라 이미지를 다르게 보여줌
        var image = UIImage()
        if status != nil {
            switch status {
            case "Rain", "Mist", "Drizzle", "Thunderstorm":
                image = UIImage(named: "rainy.png")!
            case "Clouds", "Haze":
                image = UIImage(named: "cloudy.png")!
            case "Blizzard":
                image = UIImage(named: "blizzard.png")!
            case "Snow":
                image = UIImage(named: "snow.png")!
            default:
                image = UIImage(named: "sunny.png")!
            }
        }
        return image
    }
}
