import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const LavoApp());

class LavoApp extends StatelessWidget {
  const LavoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1LAVO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF16A6A1)),
        useMaterial3: true,
      ),
      home: const WebsiteScreen(),
    );
  }
}

class WebsiteScreen extends StatefulWidget {
  const WebsiteScreen({super.key});

  @override
  State<WebsiteScreen> createState() => _WebsiteScreenState();
}

class _WebsiteScreenState extends State<WebsiteScreen> {
  late final WebViewController controller;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => loading = true),
          onPageFinished: (_) => setState(() => loading = false),
          onWebResourceError: (_) => setState(() => loading = false),
        ),
      )
      ..loadRequest(Uri.parse('https://www.1lavo.com/'));
  }

  Future<bool> handleBack() async {
    if (await controller.canGoBack()) {
      await controller.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: handleBack,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(controller: controller),
              if (loading)
                const LinearProgressIndicator(
                  minHeight: 3,
                  color: Color(0xFF16A6A1),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
