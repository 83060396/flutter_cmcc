import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CommonHtml5Page extends StatefulWidget {
  final String url;
  final String title;

  CommonHtml5Page(this.url, this.title);

  @override
  State<StatefulWidget> createState() {
    return new CommonHtml5PageState(this.url, this.title);
  }
}

class CommonHtml5PageState extends State<CommonHtml5Page> {
  final String url;
  final String titleName;
  bool isLoad = true;
  final flutterWebViewPlugin = new FlutterWebviewPlugin();
  CommonHtml5PageState(this.url, this.titleName);

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: this.url,
      appBar: new AppBar(
        title: new Text(titleName),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onStateChanged.listen((state) {
      if (state.type == WebViewState.finishLoad) {
        // 加载完成
        setState(() {
          isLoad = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoad = true;
        });
      }
    });
  }
}
