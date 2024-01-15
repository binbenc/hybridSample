package com.cxb.android.hybridsample

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity

class HybridActivity : FlutterActivity() {

    companion object {
        private const val PARAMS = "params"
        private var params = ""


        fun toFlutter(context: Context, params: String) {
            context.startActivity(Intent(context, HybridActivity::class.java).apply {
                putExtra(PARAMS, params)
            })
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun getInitialRoute(): String? {
        return if (HybridActivity.params == "") super.getInitialRoute() else HybridActivity.params
    }
}