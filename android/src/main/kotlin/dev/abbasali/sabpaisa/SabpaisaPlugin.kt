package dev.abbasali.sabpaisa

import androidx.annotation.NonNull
import android.app.Activity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;

import android.util.Log
import com.sabpaisa.gateway.android.sdk.SabPaisaGateway
import com.sabpaisa.gateway.android.sdk.interfaces.IPaymentSuccessCallBack
import com.sabpaisa.gateway.android.sdk.models.TransactionResponsesModel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import java.util.Objects


/** SabpaisaPlugin */
class SabpaisaPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, IPaymentSuccessCallBack<TransactionResponsesModel> {
  private lateinit var channel : MethodChannel
  private lateinit var activity: Activity
  var resultCallback:MethodChannel.Result?=null


  override fun onAttachedToActivity(activityPluginBinding: ActivityPluginBinding) {
        activity = activityPluginBinding.activity as FlutterActivity
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "dev.abbasali.sabpaisa")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "callSabPaisaSdk") {
      resultCallback = result
                val arguments = call.arguments as ArrayList<String>
                val sabPaisaGateway1 =
                    SabPaisaGateway.builder()
                        .setAmount(arguments[4].toDouble())   //Mandatory Parameter
                        .setFirstName(arguments[0]) //Mandatory Parameter
                        .setLastName(arguments[1]) //Mandatory Parameter
                        .setMobileNumber(arguments[3])
                        .setEmailId(arguments[2])//Mandatory Parameter
                        .setSabPaisaPaymentScreen(true)//Mandatory Parameter
                        .setSalutation("")
                        .setClientCode(arguments[5])
                        .setAesApiIv(arguments[6])
                        .setAesApiKey(arguments[7])
                        .setTransUserName(arguments[8])
                        .setTransUserPassword(arguments[9])
                        .build()

                SabPaisaGateway.setInitUrl("https://securepay.sabpaisa.in/SabPaisa/sabPaisaInit?v=1")
                SabPaisaGateway.setEndPointBaseUrl("https://securepay.sabpaisa.in")
                SabPaisaGateway.setTxnEnquiryEndpoint("https://txnenquiry.sabpaisa.in")


                sabPaisaGateway1.init(activity, this)

    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onPaymentFail(message: TransactionResponsesModel?) {
        val arrayList = ArrayList<String>()
        arrayList.add(message?.status.toString())
        arrayList.add(message?.clientTxnId.toString())
        resultCallback?.success(arrayList)
    }

    override fun onPaymentSuccess(response: TransactionResponsesModel?) {
        val arrayList = ArrayList<String>()
        arrayList.add(response?.status.toString())
        arrayList.add(response?.clientTxnId.toString())
        resultCallback?.success(arrayList)
    }



    override fun onDetachedFromActivityForConfigChanges() {
        // This call will be followed by onReattachedToActivityForConfigChanges().
    }

    override fun onReattachedToActivityForConfigChanges(activityPluginBinding: ActivityPluginBinding) {
    }

    override fun onDetachedFromActivity() {
    }
}
