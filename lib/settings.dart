import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String silverRate = "";
  String goldRate = "";
  String daimondRate = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(shrinkWrap: true, children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Diamond Rate",
                      // labelText: "Login",
                    ),
                    onChanged: (val) async {
                      setState(() {
                        daimondRate = val;
                      });
                    },
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Silver Rate",
                      // labelText: "Login",
                    ),
                    onChanged: (val) async {
                      setState(() {
                        silverRate = val;
                      });
                    },
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Gold Rate",
                      // labelText: "Login",
                    ),
                    onChanged: (val) async {
                      setState(() {
                        goldRate = val;
                      });
                    },
                  )),
            ])));
  }
}
