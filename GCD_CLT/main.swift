//
//  main.swift
//  GCD_CLT
//
//  Created by Игорь Михайлович Ракитянский on 15.08.16.
//  Copyright © 2016 RIM. All rights reserved.
//

import Foundation

print("Hello, World!")

let firstGroup = dispatch_group_create()

dispatch_group_async(firstGroup, dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)) { 
    for i in 0...1000 {
        if i == 1000 {
            print(i)
        }
    }
}

dispatch_group_async(firstGroup, dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)) {
    for i in 0...2000 {
        if i == 2000 {
            print(i)
        }
    }
}

dispatch_group_notify(firstGroup, dispatch_get_main_queue()) { 
    print("first group finished old tasks")
}

let secondGroup = dispatch_group_create()

dispatch_group_enter(secondGroup)
for i in 0...3000 {
    if i == 3000 {
        print(i)
    }
}
dispatch_group_leave(secondGroup)

dispatch_group_enter(secondGroup)
for i in 0...4000 {
    if i == 4000 {
        print(i)
    }
}
dispatch_group_leave(secondGroup)


dispatch_group_notify(secondGroup, dispatch_get_main_queue()) {
    print("second group finished old tasks")
}
dispatch_group_wait(secondGroup, DISPATCH_TIME_FOREVER)
print("there are no tasks in second group")




dispatch_main()

