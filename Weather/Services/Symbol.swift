//
//  Symbol.swift
//  Weather
//
//  Created by 김주협 on 2022/01/29.
//

import Foundation

struct Symbol {
    struct Weather {}
    
    struct basic {}
    
    // FIXME: 각각의 사이즈 default값 지정하고 개별적으로도 설정하게끔 수정 필요.
    static let symbolSize = UIFont.systemFont(ofSize: 21)
    static let config = UIImage.SymbolConfiguration(font: symbolSize)
}

extension Symbol.Weather {
    static let sunMax = UIImage(systemName: "sun.max")!
    static let sunMaxF = UIImage(systemName: "sun.max.fill")!
    
    static let moon = UIImage(systemName: "moon")!
    static let moonF = UIImage(systemName: "moon.fill")!
    
    static let snows = UIImage(systemName: "snow")!
    
    static let wind = UIImage(systemName: "wind")!
    
    static let cloud = UIImage(systemName: "cloud")!
    static let cloudF = UIImage(systemName: "cloud.fill")!
    
    static let drizzle = UIImage(systemName: "cloud.drizzle")!
    static let drizzleF = UIImage(systemName: "cloud.drizzle.fill")!
    
    static let rain = UIImage(systemName: "cloud.rain")!
    static let rainF = UIImage(systemName: "cloud.rain.fill")!
    
    static let heavyrain = UIImage(systemName: "cloud.heavyrain")!
    static let heavyrainF = UIImage(systemName: "cloud.heavyrain.fill")!
    
    static let fog = UIImage(systemName: "cloud.fog")!
    static let fogF = UIImage(systemName: "cloud.fog.fill")!
    
    static let hail = UIImage(systemName: "cloud.hail")!
    static let hailF = UIImage(systemName: "cloud.hail.fill")!
    
    static let snow = UIImage(systemName: "cloud.snow")!
    static let snowF = UIImage(systemName: "cloud.snow.fill")!
    
    static let sun = UIImage(systemName: "cloud.sun")!
    static let sunF = UIImage(systemName: "cloud.sun.fill")!
    
}

extension Symbol.basic {
    static let back = UIImage(systemName: "chevron.backward", withConfiguration: Symbol.config)!
    
    static let setting = UIImage(systemName: "gearshape.fill", withConfiguration: Symbol.config)!
}
