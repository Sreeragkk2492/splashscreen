import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Webviewex(),
  ));
}

class Webviewex extends StatefulWidget {
  const Webviewex({super.key});

  @override
  State<Webviewex> createState() => _WebviewexState();
}

class _WebviewexState extends State<Webviewex> {
  late WebViewController webViewController;

  @override
  void initState() {
   webViewController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..loadRequest(Uri.parse('https://web.whatsapp.com/'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text('webview'),
      ),
      body:Column(
        children: [
      //    Image.asset('assets/images/wall.jpg'),
           WebViewWidget(controller: webViewController)
        ],
      ),
    );
  }
}
