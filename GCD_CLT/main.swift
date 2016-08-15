//
//  main.swift
//  GCD_CLT
//
//  Created by Игорь Михайлович Ракитянский on 15.08.16.
//  Copyright © 2016 RIM. All rights reserved.
//

import Foundation

print("Hello, World!")

class A {
    var someVal = 0

    func increaseValueBy1000() {
        for _ in 0..<1000 {
            let v = someVal + 1
            print(v)
            someVal = v
        }
    }
}

let instance = A()

dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
    instance.increaseValueBy1000()
}

instance.increaseValueBy1000()




dispatch_main()

