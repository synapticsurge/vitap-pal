import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../providers/features.dart';
import '../../../models/features_model.dart';

class FeaturesStatus extends ConsumerWidget {
  FeaturesStatus({super.key});
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuresAsync = ref.watch(featuresProvider);
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        key: GlobalKey<ScaffoldMessengerState>(),
        appBar: AppBar(title: Text("Features Status")),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final snackbar = SnackBar(
              content: const Text('Refreshing features Status page...'),
              duration: const Duration(minutes: 2),
            );

            _scaffoldMessengerKey.currentState?.showSnackBar(snackbar);

            try {
              var _ = await ref.refresh(featuresProvider.future);
              _scaffoldMessengerKey.currentState?.clearSnackBars();
              _scaffoldMessengerKey.currentState?.showSnackBar(
                const SnackBar(
                  content: Text('Refreshed!'),
                  duration: Duration(seconds: 3),
                ),
              );
            } catch (e) {
              _scaffoldMessengerKey.currentState?.clearSnackBars();
              _scaffoldMessengerKey.currentState?.showSnackBar(
                const SnackBar(
                  content: Text('Failed to refresh'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          },
          tooltip: 'Refresh',
          child: const Icon(Icons.rotate_left_outlined),
        ),
        body: featuresAsync.when(
          data: (features) {
            return ListView(
              children: [
                ListTile(
                  title: Text(
                    "AppFeatures",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "Status",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                ...AppFeatures.values.map((feature) {
                  final flag = features.flags[feature]!;
                  return ListTile(
                    title: Text(feature.name),
                    subtitle: flag.note.isNotEmpty ? Text(flag.note) : null,
                    trailing: Icon(
                      flag.enabled ? Icons.check_circle : Icons.cancel,
                      color: flag.enabled ? Colors.green : Colors.red,
                    ),
                  );
                }),
              ],
            );
          },

          loading: () {
            return Skeletonizer(
              enabled: true,
              child: ListView.builder(
                itemCount: AppFeatures.values.length,
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text("Feature Title"),
                    subtitle: Text("Loading description..."),
                    trailing: Icon(Icons.circle),
                  );
                },
              ),
            );
          },
          error: (error, _) {
            ScaffoldMessenger.of(context).clearSnackBars();
            final k = Center(
              child: Text(
                "Oops! Looks like you're offline.\nCheck your connection and try again!",
              ),
            );
            return k;
          },
        ),
      ),
    );
  }
}
