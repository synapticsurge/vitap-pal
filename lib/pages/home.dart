import 'package:flutter/material.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), body: Creds());
  }

  AppBar appBar() {
    return AppBar(
      title: Text("VitapMate", style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

Future<String> test(m,p) async{
 var k = await getClient();
await checkClient(iclient:k,username: m,password: p);
var n = await clientLogin(iclient: k);
//print(n);
return n.$2;
}



class Creds extends StatefulWidget {
  const Creds({super.key});

  @override
  State<Creds> createState() => _CredsState();
}

class _CredsState extends State<Creds> {
  final _formKey = GlobalKey<FormState>();

  String? mail;
  String? password;
  String stat = "no val";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter your email'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              mail = value;
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter your password'),
            obscureText: true,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              password = value;
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  stat = await test(mail,password);
                  //print('Email: $mail, Password: $password');
                }
              },
              child: const Text("submit"),
            ),
          ),
          Text(stat)
        ],
      ),
      
    );
  }
}
