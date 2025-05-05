import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'appbar.dart';
import 'navbar.dart';

class ScaffoldWithNavBar extends ConsumerWidget {
  final Widget child;
  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.listen(appStateProvider, (previous, current) {
    // try {
    //   if (!current.networkUp &&
    //       (current.temp == 0 || previous?.temp != current.temp)) {
    //     ScaffoldMessenger.of(context).clearSnackBars();
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         behavior: SnackBarBehavior.floating,
    //         elevation: 0,
    //         margin: EdgeInsets.all(10),

    //         content: Row(
    //           children: [
    //             Expanded(child: Text("Oops no internet connection ")),
    //             ElevatedButton(
    //               style: ElevatedButton.styleFrom(),
    //               onPressed: () {
    //                 // if (current.temp == 0) {
    //                 //   ref.read(appStateProvider.notifier).triggers();
    //                 // }
    //                 ScaffoldMessenger.of(context).clearSnackBars();
    //               },

    //               child: Text("Dismis"),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   } else if (previous?.networkUp == false && current.networkUp) {
    //     ScaffoldMessenger.of(context).clearSnackBars();
    //   }
    // } catch (e) {
    //   ();
    // }
    // });
    return Scaffold(
      body: child,
      appBar: TopAppBar(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
