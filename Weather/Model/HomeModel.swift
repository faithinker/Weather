//
//  HomeModel.swift
//  Weather
//
//  Created by 김주협 on 2022/01/29.
//

import Foundation

struct HomeModel: Decodable {
    let location: String?
    let temp: Int?
}
