//
//  ViewModel.swift
//  combineTest
//
//  Created by Supernova SanDick SSD on 2019/7/9.
//  Copyright © 2019 Seven. All rights reserved.
//

import SwiftUI
import Combine
//个人理解：感觉Combine和block比较像
class ViewModel: BindableObject {
    //didChange 是BindableObject协议必须实现的
    var didChange = PassthroughSubject<ViewModel, Never>()
    var datas = [Model](){
        didSet{
            print("changed ====")
            //这里就相当于发送通知或者说是调用block
            didChange.send(self)
        }
    }
    //这个暂时还没有发现有什么用
    var cancel: Cancellable? {
        didSet{
            oldValue?.cancel()
        }
    }
    deinit {
        cancel?.cancel()
    }
    
    init() {
        print(#function)
    }
    
}
extension ViewModel {
    func addData() -> () {
        let id = Int.random(in: 0...9999)
        let title = "\(id)"
        let subTitle = "Sub-\(id)"
        let newData = Model.init(id: id, title: title, subTitle: subTitle)
        datas.append(newData)
        print(datas)
    }
    func removeData() -> () {
        guard datas.count > 0 else {
            return
        }
        let index = datas.count - 1
        datas.remove(at: index)
        print(datas)
    }
}
