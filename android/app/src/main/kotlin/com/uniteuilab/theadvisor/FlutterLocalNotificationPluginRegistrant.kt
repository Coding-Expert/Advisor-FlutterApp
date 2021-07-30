package com.uniteuilab.theadvisor
    
    import io.flutter.app.FlutterApplication
    import io.flutter.plugin.common.PluginRegistry
    import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
    import io.flutter.view.FlutterMain
    import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin


class FlutterLocalNotificationPluginRegistrant {

companion object {
    fun registerWith(registry: PluginRegistry) {
        if (alreadyRegisteredWith(registry)) {
            ////Log.d("Local Plugin", "Already Registered");
            return
        }
        FlutterLocalNotificationsPlugin.registerWith(registry.registrarFor("com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin"))
        /////Log.d("Local Plugin", "Registered");
    }

    private fun alreadyRegisteredWith(registry: PluginRegistry): Boolean {
        val key = FlutterLocalNotificationPluginRegistrant::class.java.canonicalName
        if (registry.hasPlugin(key)) {
            return true
        }
        registry.registrarFor(key)
        return false
    }
}}