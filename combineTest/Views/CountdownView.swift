//
//  CountdownView.swift
//  combineTest
//
//  Created by Supernova SanDick SSD on 2019/7/10.
//  Copyright © 2019 Seven. All rights reserved.
//

import SwiftUI

struct CountdownView : View {
    @ObjectBinding var viewModel = CountdownViewModel()
    var body: some View {
        Text("\(viewModel.number)")
        .font(.system(.title))
            .onAppear {
                print("appear")
        }
    }
}

#if DEBUG
struct CountdownView_Previews : PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
#endif
