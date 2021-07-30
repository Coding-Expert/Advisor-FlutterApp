package com.uniteuilab.theadvisor
    
    import android.app.NotificationChannel
    import android.app.NotificationManager
    import android.content.Context
    import android.os.Build
    import io.flutter.app.FlutterApplication
    import io.flutter.plugin.common.PluginRegistry
    import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
    import io.flutter.plugins.GeneratedPluginRegistrant
    import io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin
    import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService
    import io.flutter.view.FlutterMain
    import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin
    
    class Application : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {

        override fun onCreate() {
            super.onCreate()
            createChannel()
            FlutterFirebaseMessagingService.setPluginRegistrant(this)
        }

        override fun registerWith(registry: PluginRegistry?) {
            if (registry != null) {
                FlutterLocalNotificationPluginRegistrant.registerWith(registry)
                FirebaseMessagingPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"))
            }
        }

        private fun createChannel(){
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                // Create the NotificationChannel
                val name = getString(R.string.default_notification_channel_id)
                val channel = NotificationChannel(name, "default", NotificationManager.IMPORTANCE_HIGH)
                val notificationManager: NotificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
                notificationManager.createNotificationChannel(channel)
            }
        }
    
    }