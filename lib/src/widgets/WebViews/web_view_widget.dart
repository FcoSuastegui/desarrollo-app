/* import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewsWidget extends StatelessWidget {

  final String src;
  WebViewsWidget({ this.src }); 

  final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: src,
      javascriptChannels: jsChannels,
      mediaPlaybackRequiresUserGesture: false,
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: SafeArea(
        child: Container(
          color: Colors.white,
          child: const Center(
            child: Text('Cargando.....'),
          ),
        )
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => flutterWebViewPlugin.goBack(),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () => flutterWebViewPlugin.goForward(),
                ),
                IconButton(
                  icon: const Icon(Icons.autorenew),
                  onPressed: () => flutterWebViewPlugin.reload(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
} */