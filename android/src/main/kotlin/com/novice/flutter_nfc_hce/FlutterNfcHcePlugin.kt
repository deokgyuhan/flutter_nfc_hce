package com.novice.flutter_nfc_hce

import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.nfc.NfcAdapter
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterNfcHcePlugin */
class FlutterNfcHcePlugin: FlutterPlugin, MethodCallHandler, ActivityAware  {
  // add code
  private var mNfcAdapter: NfcAdapter? = null
  private var activity: Activity? = null
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_nfc_hce")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(call.method == "startNfcHce") {
      val content = call.argument<String>("content")

      if (content != null) {
        startNfcHce(content)
        result.success("sueecss")
      } else {
        result.success("failure")
      }
    } else if(call.method == "isSupportNfcHceFeature") {
        if(supportNfcHceFeature()) {
            result.success("true")
        } else {
            result.success("false")
        }
    }  else if(call.method == "isSupportSecureNfcSupported") {
        if(supportSecureNfcSupported()) {
            result.success("true")
        } else {
            result.success("false")
        }
    } else if(call.method == "isNfcEnable") {
        if(checkNFCEnable()) {
            result.success("true")
        } else {
            result.success("false")
        }
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

    override fun onDetachedFromActivity() {
        activity = null
        mNfcAdapter = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        mNfcAdapter = NfcAdapter.getDefaultAdapter(activity)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        mNfcAdapter = NfcAdapter.getDefaultAdapter(activity)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
        mNfcAdapter = null
    }
    private fun startNfcHce(id: String) {
     if (supportNfcHceFeature()) {
      Log.i("TEST", "---------------------->supportNfcHceFeature: "+supportNfcHceFeature())
      initService(id)
      }
    }

    private fun supportNfcHceFeature() =
        checkNFCEnable() && activity?.packageManager!!.hasSystemFeature(PackageManager.FEATURE_NFC_HOST_CARD_EMULATION)

    //2023.09.08 add function
    @RequiresApi(Build.VERSION_CODES.Q)
    private fun supportSecureNfcSupported(): Boolean {
        Log.i("TEST", "---------------------->isSecureNfcEnabled: "+mNfcAdapter?.isSecureNfcEnabled)

        return if (mNfcAdapter == null) {
            false
        } else {
            mNfcAdapter?.isSecureNfcEnabled == true
        }
    }

    private fun initService(id: String) {
      val intent = Intent(activity, KHostApduService::class.java)
      intent.putExtra("ndefMessage", id)
        activity?.startService(intent)
    }

    private fun checkNFCEnable(): Boolean {
        return if (mNfcAdapter == null) {
            false
        } else {
            mNfcAdapter?.isEnabled == true
        }
    }
}
