// Copyright © 2015 Venture Media Labs. All rights reserved.
//
// This file is part of StyleKit. The full StyleKit copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import UIKit

public protocol StyleHandler {

    var name: String { get }

    func apply(_ view: UIView)

}

open class StyleKit: NSObject {

    fileprivate static let sharedInstance = StyleKit()

    fileprivate var handlers = [StyleHandler]()

    open class func configure(_ handlers: [StyleHandler]) {
        UIView.swizzleMethodSelector("awakeFromNib", withSelector: "StyleKit_awakeFromNib", forClass: UIView.classForCoder())
        for handler in handlers {
            sharedInstance.handlers.append(handler)
        }
    }

    open class func applyStyle(_ styleClassNames: String, toView: UIView) {
        let names = styleClassNames.components(separatedBy: ";")
        for name in names {
            var handlerFound = false
            for handler in sharedInstance.handlers {
                if handler.name == name {
                    handler.apply(toView)
                    handlerFound = true
                }
            }
            if handlerFound == false {
                print("StyleHandler '\(name)' not found")
            #if DEBUG
                fatalError()
            #endif
            }
        }
    }

}
