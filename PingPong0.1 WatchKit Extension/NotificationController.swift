//
//  NotificationController.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/4/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {

    override var body: NotificationView {
        return NotificationView()
    }
}
