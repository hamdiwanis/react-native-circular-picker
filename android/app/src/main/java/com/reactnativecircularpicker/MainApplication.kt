package com.reactnativecircularpicker

import android.app.Application

import com.facebook.react.ReactApplication
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.shell.MainReactPackage
import com.facebook.soloader.SoLoader

import com.reactnativecircularpicker.circularpicker.CircularPickerPackage

import java.util.Arrays

class MainApplication : Application(), ReactApplication {

    override fun getReactNativeHost(): ReactNativeHost = object : ReactNativeHost(this) {
        override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG

        override fun getPackages(): List<ReactPackage> = Arrays.asList(
                MainReactPackage(),
                CircularPickerPackage()
        )

        override fun getJSMainModuleName(): String = "index"
    }

    override fun onCreate() {
        super.onCreate()
        SoLoader.init(this, /* native exopackage */ false)
    }
}
