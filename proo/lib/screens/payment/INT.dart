import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class int extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: WebViewLoad()));
  }
}

class WebViewLoad extends StatefulWidget {
  WebViewLoadUI createState() => WebViewLoadUI();
}

class WebViewLoadUI extends State<WebViewLoad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Screen '),

      centerTitle: true,
        backgroundColor: Colors.lightBlue[200],
        elevation: 4.0,
      ),
      body: WebView(
        initialUrl: 'https://paystack.com/pay/8xn6k0x2uj',
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: 'Flutter;Webview',
        navigationDelegate: (navigation) {
          if (navigation.url == 'https://standard.paystack.co/close') {
            Navigator.of(context).pop(); //close webview
          }
          if (navigation.url == "https://hello.pstk.xyz/callback") {
            Navigator.of(context).pop(); //close webview
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
