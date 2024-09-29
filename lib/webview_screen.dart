import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  int? serviceId;
  WebViewApp(this.serviceId);

   // Constructor for the WebViewApp widget

  @override
  State<WebViewApp> createState() => _WebViewAppState(); // Creating the state object
}

class _WebViewAppState extends State<WebViewApp> {
  bool isLoading = true; // Variable to track if the WebView is still loading
  late final WebViewController controller; // Controller to manage the WebView

  @override
  void initState() {
    super.initState();

    // Initializing the WebViewController with settings
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Allow JavaScript execution in WebView
      ..setBackgroundColor(const Color(0x00000000)) // Set WebView background to transparent
      ..setNavigationDelegate( // Set navigation event handlers
        NavigationDelegate(
          // Called when a new page starts loading
          onPageStarted: (url) {
            setState(() {
              isLoading = true; // Show loading indicator when page starts loading
            });
          },
          // Called when the page finishes loading
          onPageFinished: (url) {
            setState(() {
              isLoading = false; // Hide loading indicator when page finishes loading
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('http://192.168.1.27:8082/servicevisitreport/${widget.serviceId}')); // Load the initial webpage (flutter.dev)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Service')), // AppBar with a title
      body: Stack( // Stack allows overlaying widgets
        children: [
          // The WebView widget that shows the webpage
          WebViewWidget(controller: controller),
          // Show CircularProgressIndicator if the page is loading
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(), // Loading spinner in the center of the screen
            ),
        ],
      ),
    );
  }
}