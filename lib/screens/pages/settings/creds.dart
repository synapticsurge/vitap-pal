import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/providers/user.dart';
import 'package:vitapmate/router/route_names.dart';

class Creds extends ConsumerStatefulWidget {
  const Creds({super.key});

  @override
  ConsumerState<Creds> createState() => _CredsState();
}

class _CredsState extends ConsumerState<Creds> {
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _running = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _running = true;
      });
      String username = _usernameController.text;
      String password = _passwordController.text;
      var n = await ref
          .read(userProvider.notifier)
          .updateCreds(username, password);
      if (!mounted) return;
      if (!n.$1) {
        if (n.$2 == "NE") {
          _scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                "Oops! No internet right now. Give it another try when you're back online.",
              ),
            ),
          );
        } else if (n.$2 == "VE") {
          _scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text("Oops! It looks like Vtop is Down"),
            ),
          );
        } else {
          _scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(behavior: SnackBarBehavior.floating, content: Text(n.$2)),
          );
        }
      } else {
        _scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("Sucessfully saved creds"),
          ),
        );

        GoRouter.of(context).goNamed(RouteNames.timetablePageRoutename);
      }
    }
    setState(() {
      _running = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Credentials",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Text(
              "Enter your Vtop credentials",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your Vtop username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your Vtop password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }

                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: _running ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !_running ? AppColors.primary : Colors.grey,
                    ),
                    child: Text('Submit'),
                  ),
                  CredsDisp(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CredsDisp extends ConsumerWidget {
  const CredsDisp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Container(
      child: user.when(
        loading: () {
          return Text("loading");
        },
        data: (data) {
          return Column(
            children: [
              Text(data.username ?? ""),
              SizedBox(width: 20, height: 20),
              Text(data.password ?? ""),
            ],
          );
        },
        error: (error, stackTrace) {
          return Text("something went worng $error");
        },
      ),
    );
  }
}
