package com.flutterapp.flutterapp

import android.os.Bundle
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: io.flutter.app.FlutterActivity(){

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
  }

}

