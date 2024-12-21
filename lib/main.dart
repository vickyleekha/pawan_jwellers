import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'AppTheme.dart';
import 'CustomWidget.dart';
import 'pdf_preview_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pawan Jwellers',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pawan Jwellers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";
  String itemName = "";
  String itemWeight = "";
  String itemQty = "";
  String rate = "";

  String hsn = "";

  String address = "";
  String dropdownValue1 = 'Mode of Payment';
  String itemType = 'Item Type';

  String purity = 'Purity';
  String documentType = 'Document';
  String documentNumber = '';

  var listItem = [];

  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // actions: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Address",
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      color: Color(0xFF171634),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AlertDialog alert = AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(11))),
                        content: Container(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          height: 360,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Add Address",
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontName,
                                            color: Color(0xFF171634),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                      width: 285,
                                      child: customTextFeildWithGrayMultiline(
                                          readOnly: false,
                                          hintText: 'Write your address',
                                          controller: addressController)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: 285,
                                      height: 35,
                                      child: customTextFeildWithGrayAlert(
                                          readOnly: false,
                                          hintText: 'City',
                                          controller: cityController)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: 285,
                                      height: 35,
                                      child: customTextFeildWithGrayAlert(
                                          hintText: 'State',
                                          readOnly: false,
                                          controller: stateController)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: 285,
                                      height: 35,
                                      child: customTextFeildWithGrayAlert(
                                          readOnly: false,
                                          hintText: 'Pin Code',
                                          controller: pinController)),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 120,
                                  height: 40,
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 30, bottom: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:
                                        const Color.fromRGBO(255, 166, 158, 1),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        address =
                                            "${addressController.text},\n${cityController.text},\n${stateController.text}-${pinController.text}";
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: customTextFieldWhite(
                                      text: "Done",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        insetPadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.zero,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      ); // sh
                    },
                    child: Text(
                      address == "" ? "+ Add" : "Change",
                      style: const TextStyle(
                        fontFamily: AppTheme.fontName,
                        color: Color.fromRGBO(103, 167, 237, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: address == "" ? false : true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    width: 250,
                    // height: 50,
                    child: Text(
                      address,
                      style: const TextStyle(
                        fontFamily: AppTheme.fontName,
                        color: Color(0xFF171634),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                    // labelText: "Login",
                  ),
                  onChanged: (val) async {
                    setState(() {
                      name = val;
                    });
                  },
                )),
            Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Item Name",
                    // labelText: "Login",
                  ),
                  onChanged: (val) async {
                    setState(() {
                      itemName = val;
                    });
                  },
                )),
            Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Item Weight",
                    // labelText: "Login",
                  ),
                  onChanged: (val) async {
                    setState(() {
                      itemWeight = val;
                    });
                  },
                )),
            Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Item Rate",
                    // labelText: "Login",
                  ),
                  onChanged: (val) async {
                    setState(() {
                      rate = val;
                    });
                  },
                )),

            Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Item Qty",
                    // labelText: "Login",
                  ),
                  onChanged: (val) async {
                    setState(() {
                      itemQty = val;
                    });
                  },
                )),
            Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "HSN",
                    // labelText: "Login",
                  ),
                  onChanged: (val) async {
                    setState(() {
                      hsn = val;
                    });
                  },
                )),

            Row(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: DropdownButton<String>(
                  value: documentType,
                  onChanged: (String? newValue) {
                    setState(() {
                      documentType = newValue!;
                    });
                  },
                  items: <String>[
                    'Document',
                    'PAN',
                    'ADHAR',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ]),
            Container(

                // padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Document Id",
                // labelText: "Login",
              ),
              onChanged: (val) async {
                setState(() {
                  documentNumber = val;
                });
              },
            )),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: DropdownButton<String>(
                    value: itemType,
                    onChanged: (String? newValue) {
                      setState(() {
                        itemType = newValue!;
                      });
                    },
                    items: <String>['Item Type', 'Gold', 'Sliver', 'Diamond']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: DropdownButton<String>(
                    value: dropdownValue1,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                    items: <String>[
                      'Mode of Payment',
                      'Cash',
                      'Credit Card',
                      'Debit Card'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Row(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: DropdownButton<String>(
                  value: purity,
                  onChanged: (String? newValue) {
                    setState(() {
                      purity = newValue!;
                    });
                  },
                  items: <String>['Purity', '14K', '18K', '22K']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ]),

            // Row(
            //   children: [
            TextButton(
                onPressed: () {
                  listItem.add([
                    itemName,
                    itemWeight,
                    itemType,
                    itemQty,
                    dropdownValue1,
                    rate,
                    hsn,
                    purity,
                  ]);
                },
                child: Container(
                  height: 50,
                  width: 300,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
                // child: const Icon(Icons.add),
                ),
            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (builder) => ViewItem(listItem: listItem)));
            //     },
            //     child: Container(
            //       height: 50,
            //       width: 100,
            //       color: Colors.blue,
            //       child: const Center(
            //         child: Text(
            //           'View Item',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     )
            //     // child: const Icon(Icons.add),
            //     ),
            //   ],
            // ),

            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => PdfPreviewPage(
                          address: address,
                          name: name,
                          listItem: listItem,
                          documentType: documentType,
                          documentNumber: documentNumber)));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Bill',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
                // child: const Icon(Icons.add),
                ), // This trailing

            // ListView.builder(itemBuilder: (context, index) {
            //   return Text(listItem[index]);
            // }),
          ],
        ),
      ),
    );
  }
}
