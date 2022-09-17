import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {
  static const routeName = '/web-view-widget';
  const WebViewWidget({Key? key}) : super(key: key);

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    final url = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            )),
        title: Text(
          'Web View',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: WebView(
        initialUrl: url,
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),
    );
  }
}
