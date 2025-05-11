import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vitapmate/core/constants/constants.dart';
import '../../../providers/app_state.dart';
import '../../../providers/client.dart';
import '../../../providers/semid.dart';
import '../../../providers/settings.dart';
import '../../../providers/user.dart';
import 'package:vitapmate/core/router/route_names.dart';

final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Creds extends ConsumerWidget {
  const Creds({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,

      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Credentials",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(children: [CredsInput(), SemidSelection(), CredsDisp()]),
      ),
    );
  }
}

class CredsInput extends ConsumerStatefulWidget {
  const CredsInput({super.key});

  @override
  ConsumerState<CredsInput> createState() => _CredsInputState();
}

class _CredsInputState extends ConsumerState<CredsInput> {
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
      }
    }
    setState(() {
      _running = false;
    });
  }

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.backgroundDark, width: 20),
      ),
      child: Column(
        children: [
          Text(
            "Enter your Vtop credentials",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.supervised_user_circle_sharp),
                    hintText: 'Enter your Vtop username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: obscure,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(obscure ? Icons.lock : Icons.lock_open),
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                    hintText: 'Enter your Vtop password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _running ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        !_running ? AppColors.primary : Colors.grey,
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CredsDisp extends ConsumerStatefulWidget {
  const CredsDisp({super.key});

  @override
  ConsumerState<CredsDisp> createState() => _CredsDispState();
}

class _CredsDispState extends ConsumerState<CredsDisp> {
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.backgroundDark, width: 20),
      ),
      child: user.when(
        loading: () {
          return Text("loading");
        },
        data: (data) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                "Saved Data ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              Row(
                children: [
                  Text(
                    data.password == null ? "No Username" : "Username ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    data.password == null ? "" : ": ${data.username}",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      data.password == null
                          ? "No Password"
                          : "Password : ${showPass ? data.password : " ************"}",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                    icon: Icon(!showPass ? Icons.lock : Icons.lock_open),
                  ),
                ],
              ),
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

class SemidSelection extends ConsumerStatefulWidget {
  const SemidSelection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SemidSelectionState();
}

class _SemidSelectionState extends ConsumerState<SemidSelection> {
  @override
  Widget build(BuildContext context) {
    var settings = ref.watch(settingsProvider);
    var c = ref.watch(userProvider);
    var client = ref.watch(clientProvider);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.backgroundDark, width: 20),
      ),
      child: c.when(
        error: (error, stackTrace) => Text("error $error"),
        loading: () => CircularProgressIndicator(),
        data: (value) {
          if (value.username == null && value.password == null) {
            return Text("Enter your VTOP credentials above to continue.");
          } else if ((client.value == null ||
                  ref.read(appStateProvider).isLogin == false) &&
              settings.value?.selSemId == null) {
            return CircularProgressIndicator();
          }
          var tt = ref.watch(semidsProvider);
          return tt.when(
            loading: () => CircularProgressIndicator(),
            error: (error, stackTrace) => Text("error $error"),
            data: (value) {
              List<DropdownMenuEntry> menu = [];
              for (var val in value) {
                menu.add(
                  DropdownMenuEntry(
                    value: val[DBsemtable.semIDrow],
                    label: val[DBsemtable.semNamerow]!,
                  ),
                );
              }

              return Column(
                children: [
                  Text(
                    "Select Semester ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  DropdownMenu(
                    dropdownMenuEntries: menu,
                    initialSelection: settings.value?.selSemId,
                    label: const Text('Default Semester'),
                    width: 300,
                    hintText: "Select semester",
                    onSelected: (value) async {
                      var ni = settings.value?.selSemId;

                      await ref
                          .read(settingsProvider.notifier)
                          .changeSemId(value);
                      //ref.invalidate(timetableProvider);
                      if (!mounted) return;
                      if (ni == null) {
                        GoRouter.of(
                          // ignore: use_build_context_synchronously
                          context,
                        ).goNamed(RouteNames.timetablePageRoutename);
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
