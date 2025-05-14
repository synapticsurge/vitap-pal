import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MenuOptions { showUserAgent, desktopMode }

class Menu extends StatelessWidget {
  final WebViewController webViewController;
  const Menu({super.key, required this.webViewController});
  Future<void> _onShowUserAgent() {
    return webViewController.runJavaScript(
      'Toaster.postMessage("User Agent: " + navigator.userAgent);',
    );
  }

  Future<void> _desktopMode() {
    String js =
        "document.querySelector('meta[name=\"viewport\"]').setAttribute('content', 'width=1024px, initial-scale=' + (document.documentElement.clientWidth / 1024));";
    return webViewController.runJavaScript(js);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOptions>(
      key: const ValueKey<String>('ShowPopupMenu'),
      onSelected: (MenuOptions value) {
        switch (value) {
          case MenuOptions.showUserAgent:
            _onShowUserAgent();
          case MenuOptions.desktopMode:
            _desktopMode();
        }
      },
      itemBuilder:
          (BuildContext context) => <PopupMenuItem<MenuOptions>>[
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.showUserAgent,
              child: Text('Show user agent'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.desktopMode,
              child: Text('Desktop mode'),
            ),
          ],
    );
  }
}
