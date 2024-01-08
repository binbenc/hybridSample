package com.cxb.android.hybridsample

import android.app.Application

class CApplication:Application() {

    override fun onCreate() {
        super.onCreate()
        FlutterUtils.context = this
        FlutterUtils.init()
    }
}