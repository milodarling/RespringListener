This tweak is for developers to use to respring the right way easily.

Respringing the "right way" will save battery usage statistics. Also, the common way of respringing by using `system("kilall -9 SpringBoard")` is deprecated in iOS 8.

So, in certain situations (such as when your tweak is hooked into an app, and not the SpringBoard), it can be difficult to respring the right way. With this tweak, however, it is rather easy to "send a respring, reboot, or power off command" using Darwin notifications.

All you have to do is post a notification like so:

    CFNotificationCenterPostNotification (CFNotificationCenterGetDarwinNotifyCenter(), 
                                          CFSTR("respringDevice"), 
                                          NULL, 
                                          NULL, 
                                          false);
    
Which will post a notification that RespringListener observes, and your device will respring. The notification can be `"respringDevice"` as shown above, `"rebootDevice"` to reboot it, or `"powerOffDevice"` to power it off. Enjoy!
