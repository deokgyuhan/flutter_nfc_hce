package com.novice.flutter_nfc_hce

import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.nfc.NfcAdapter
import android.util.Log
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
      val id = call.argument<String>("content")
      mNfcAdapter = NfcAdapter.getDefaultAdapter(activity)

      if (id != null) {
        startNfcHce(id)
        result.success("sueecss" + id.toString())
      } else {
        result.success("failure")
      }
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }
    private fun startNfcHce(id: String) {
     if (supportNfcHceFeature()) {
      Log.i("TEST", "---------------------->supportNfcHceFeature: "+supportNfcHceFeature())
      initService(id)
      }
    }

    private fun supportNfcHceFeature() =
        checkNFCEnable() && activity?.packageManager!!.hasSystemFeature(PackageManager.FEATURE_NFC_HOST_CARD_EMULATION)

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
