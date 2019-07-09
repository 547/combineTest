//
//  TestView.swift
//  combineTest
//
//  Created by Supernova SanDick SSD on 2019/7/9.
//  Copyright © 2019 Seven. All rights reserved.
//

import SwiftUI

struct TestView : View {
    //ObjectBinding 动态视图属性，自动订阅可绑定对象，在视图发生更改时使视图无效。==> 相当与注册成观察者 （PS：ObjectBinding 修饰的属性必须是继承了BindableObject协议的）
    @ObjectBinding var viewModel = ViewModel()
    var body: some View {
        VStack.init(alignment: .leading, spacing: 8) {
            Text("\(viewModel.datas.last?.subTitle ?? "1233")")
            Button.init("add") {
                self.viewModel.addData()
            }
            Button.init("remove") {
                self.viewModel.removeData()
            }
        }
    }
}

#if DEBUG
struct TestView_Previews : PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
#endif
