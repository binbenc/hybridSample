package com.cxb.android.hybridsample

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.appcompat.widget.AppCompatButton
import io.flutter.embedding.android.FlutterActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        findViewById<AppCompatButton>(R.id.tv_flutter).setOnClickListener {
//            startActivity(
//                FlutterActivity.createDefaultIntent(this)
//            )
            FlutterUtils.launchHybridFunc()
        }
    }
}