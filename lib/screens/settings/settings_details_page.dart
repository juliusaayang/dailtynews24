import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsDetailsPage extends StatefulWidget {
  const SettingsDetailsPage({
    required this.link,
    super.key,
  });
  final String link;

  @override
  State<SettingsDetailsPage> createState() => _SettingsDetailsPageState();
}

class _SettingsDetailsPageState extends State<SettingsDetailsPage> {
  late final WebViewController webViewController;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {const Factory(EagerGestureRecognizer.new)};

  final UniqueKey _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const BackButton(),
            Flexible(
              child: WebViewWidget(
                controller: webViewController,
                key: _key,
                gestureRecognizers: gestureRecognizers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
