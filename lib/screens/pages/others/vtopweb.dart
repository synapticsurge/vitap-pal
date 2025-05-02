import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/providers/semid.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
import 'package:webview_flutter/webview_flutter.dart';

var cookieManager = WebViewCookieManager();

class VtopWebPage extends ConsumerStatefulWidget {
  const VtopWebPage({super.key});

  @override
  ConsumerState<VtopWebPage> createState() => _VtopWebPageState();
}

class _VtopWebPageState extends ConsumerState<VtopWebPage> {
  late final WebViewController _controller;
  bool _isInitialized = false;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {},
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onHttpError: (HttpResponseError error) {},
              onWebResourceError: (WebResourceError error) {},
            ),
          );
  }

  Future<void> _initCookiesAndLoad(Iclient client) async {
    if (_isInitialized) return;

    final raw = await rustGetCookies(client: client);
    final cookieString = String.fromCharCodes(raw);
    final parts = cookieString.split('=');
    final name = parts[0];
    final value = parts[1];

    await cookieManager.setCookie(
      WebViewCookie(
        name: name,
        value: value,
        domain: 'vtop.vitap.ac.in',
        path: '/vtop',
      ),
    );

    await _controller.loadRequest(
      Uri.parse('https://vtop.vitap.ac.in/vtop/content?'),
    );

    setState(() {
      _isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final clientAsync = ref.watch(clientProvider);

    return clientAsync.when(
      data: (client) {
        var k = ref.watch(appStateProvider);
        if (!k.networkUp) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('VTOP', style: TextStyle(fontSize: 15)),
            ),
            body: Center(
              child: Column(
                children: [
                  Text("No Internet"),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !_loading ? AppColors.primary : Colors.grey,
                    ),
                    onPressed: () async {
                      setState(() {
                        _loading = true;
                      });
                      var _ =
                          await ref.read(semidsProvider.notifier).updateall();
                      ref.read(appStateProvider.notifier).triggers();
                      setState(() {
                        _loading = false;
                      });
                    },
                    child: Text("retry"),
                  ),
                ],
              ),
            ),
          );
        } else if (k.isLogin) {
          _initCookiesAndLoad(client);
          return Scaffold(
            appBar: AppBar(
              title: const Text('VTOP', style: TextStyle(fontSize: 15)),
              actions: [
                IconButton(
                  onPressed: () => _controller.reload(),
                  icon: Icon(Icons.replay_outlined),
                ),
              ],
            ),
            body: WebViewWidget(controller: _controller),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('VTOP', style: TextStyle(fontSize: 15)),
            ),
            body: Center(
              child: Column(
                children: [
                  Text("It looks like login attempt failed"),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !_loading ? AppColors.primary : Colors.grey,
                    ),
                    onPressed: () async {
                      setState(() {
                        _loading = true;
                      });
                      var _ =
                          await ref.read(semidsProvider.notifier).updateall();
                      ref.read(appStateProvider.notifier).triggers();
                      setState(() {
                        _loading = false;
                      });
                    },
                    child: Text("retry"),
                  ),
                ],
              ),
            ),
          );
        }
      },
      error: (e, se) => const Center(child: Text('error loading client')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
