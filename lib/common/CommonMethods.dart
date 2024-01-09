import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class CommonMethods {
  static String version="";
  static Future<bool> checkInternetConnectivity() async {
    String connectionStatus;
    bool isConnected = false;
    final Connectivity _connectivity = Connectivity();

    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
      if (await _connectivity.checkConnectivity() ==
          ConnectivityResult.mobile) {
        print("===internetconnected==Mobile" + connectionStatus);
        isConnected = true;
        // I am connected to a mobile network.
      } else if (await _connectivity.checkConnectivity() ==
          ConnectivityResult.wifi) {
        isConnected = true;
        print("===internetconnected==wifi" + connectionStatus);
        // I am connected to a wifi network.
      } else if (await _connectivity.checkConnectivity() ==
          ConnectivityResult.none) {
        isConnected = false;
        print("===internetconnected==not" + connectionStatus);
      }
    } on PlatformException catch (e) {
      print("===internet==not connected" + e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }
    return isConnected;
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
  }

  static void moveCursorToastPos(TextEditingController textField) {
    var cursorPos =  TextSelection.fromPosition(
         TextPosition(offset: textField.text.length));
    textField.selection = cursorPos;
  }

  static void showToast(message){
    Get.showSnackbar(GetSnackBar(message: message.toString(),
      isDismissible: false,
      duration: const Duration(seconds: 2),
    ));
  }

  static void showProgress(){
    Get.dialog( const Center(
      child: CircularProgressIndicator(
        color: Colors.black,),), barrierDismissible: false,
      useSafeArea: true,);
  }


  static void inputFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  bool  isConnect=false;

  // static void showToast(text,
  //     context,
  //     {fontSize = 16.0,
  //     length =const Duration(milliseconds: 1000),
  //     gravity = SnackPosition.BOTTOM,
  //     backColor = Colors.white,
  //     textColor = Colors.black,
  //     webBgColor = "#FFFFFF"
  //     }){
  //   Get.snackbar('Hello Shyam',text,
  //   snackPosition: SnackPosition.BOTTOM,
  //       showProgressIndicator: true,
  //       isDismissible: true,
  //       overlayBlur: 5,
  //       backgroundColor: Colors.pink,
  //       colorText: Colors.white,
  //       mainButton: TextButton(
  //           onPressed:(){
  //            Get.back();
  //           },
  //           child: const Text(
  //               "Close"
  //           )));
  //   // Fluttertoast.cancel();
  // }



  // static Future<String> createFileOfPdfUrl(link) async {
  //   String pathPDF = "";
  //   final url = link;
  //   final filename = url.substring(url.lastIndexOf("/") + 1);
  //   var request = await HttpClient().getUrl(Uri.parse(url));
  //   var response = await request.close();
  //   var bytes = await consolidateHttpClientResponseBytes(response);
  //   String dir = (await getApplicationDocumentsDirectory()).path;
  //   File file = new File('$dir/$filename');
  //   await file.writeAsBytes(bytes);
  //   pathPDF = file.path;
  //   return pathPDF;
  // }





  // static void lanchOnBrowser(BuildContext context,String url)async
  // {
  //
  //   if (await canLaunch(url)) {
  // await launch(url);
  // } else {
  // throw 'Could not launch $url';
  // }
  // }

//   static void launchURL(BuildContext context,String url) async {
//
//     // await launch(url,
//     //             enableJavaScript: true,
//     //             enableDomStorage: true,
//     //             forceWebView: false,
//     //             universalLinksOnly: true,
//     //             webOnlyWindowName: '_top',
//     //             forceSafariVC: false);
//
//     // try {
//       // Intent().
//       //     .setAction(Action.ACTION_DEFINE)
//       //   ..putExtra(Extra.EXTRA_TEXT, "json")
//       //   ..startActivity().catchError((e) => print(e));
//
//
//
//      //  var intent =new Intent();
//      //  intent.
//      // Intent()
//      //    ..setAction(android_action.Action.ACTION_SHOW_APP_INFO)
//      //    ..putExtra(android_extra.Extra.EXTRA_PACKAGE_NAME, "com.whatsapp", type: android_typedExtra.TypedExtra.stringExtra)
//      //    ..startActivity().catchError((e) => print(e));
//
//
//
//
//     //   if (await canLaunch(url)) {
//     //
//     //
//     //     await launch(url,
//     //         enableJavaScript: true,
//     //         enableDomStorage: true,
//     //         forceWebView: false,
//     //         universalLinksOnly: true,
//     //         webOnlyWindowName: '_top',
//     //         forceSafariVC: true)
//     //     ;
//     //   } else {
//     //     throw 'Could not launch $url';
//     //   }
//     // }catch(e)
//     // {
//     //   print("Errors: "+e.toString());
//     // }
//    //  try {
//    //    await launch(
//    //      url,
//    //      customTabsOption: CustomTabsOption(
//    //        toolbarColor: Theme.of(context).primaryColor,
//    //        enableDefaultShare: true,
//    //        enableUrlBarHiding: true,
//    //        enableInstantApps: true,
//    //        showPageTitle: true,
//    //        // animation: CustomTabsAnimation.slideIn(),
//    //        // // or user defined animation.
//    //        // animation: const CustomTabsAnimation(
//    //        //   startEnter: 'slide_up',
//    //        //   startExit: 'android:anim/fade_out',
//    //        //   endEnter: 'android:anim/fade_in',
//    //        //   endExit: 'slide_down',
//    //        // ),
//    //        extraCustomTabs: const <String>[
//    //
//    //          // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
//    //          // 'org.mozilla.firefox',
//    //          // // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
//    //          // 'com.microsoft.emmx',
//    //        ],
//    //      ),
//    //      safariVCOption: SafariViewControllerOption(
//    //        preferredBarTintColor: Theme.of(context).primaryColor,
//    //        preferredControlTintColor: Colors.white,
//    //        barCollapsingEnabled: true,
//    //        entersReaderIfAvailable: false,
//    //        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
//    //      ),
//    //    );
//    //  } catch (e) {
//    //    // An exception is thrown if browser app is not installed on Android device.
//    //    debugPrint("Shyam Error "+e.toString());
//    //  }
//    // }
//
//   static void launchPopUpDailog(context) {
//     showDialog<void>(
//         context: context,
//         barrierDismissible:true,
//         builder: (BuildContext context) {
//           return CupertinoAlertDialog(
//             content: Column(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: Image.asset(appImages.warning, height: 44,width: 44,),
//                 ),
//                 // Text(Languages.of(context)!.importent,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
//                 Text(Languages.of(context)!.noGoodstorage,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
//               ],
//             ),
//             actions: <Widget>[ FlatButton(child: Text(Languages.of(context)!.ok),
//                 onPressed: (){Navigator.pop(context);})],
//           );
//         });
//
//   }
//
//
//
//
//
//
//
//
//


}
