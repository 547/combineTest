//
//  CountdownViewModel.swift
//  combineTest
//
//  Created by Supernova SanDick SSD on 2019/7/10.
//  Copyright © 2019 Seven. All rights reserved.
//

import SwiftUI
import Combine
class CountdownViewModel: BindableObject {
    var didChange = PassthroughSubject<CountdownViewModel, Never>()
    var number = 10000{
        didSet{
            didChange.send(self)
        }
    }
    var timer:Timer? = nil
    init() {
        //PS:这里timer初始化不能用init那个方法，不然循环只会运行一次。至于具体原因暂时不知
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            self.number -= 1
        })
    }
    deinit {
        self.timer?.invalidate()
        self.timer = nil
    }
}
