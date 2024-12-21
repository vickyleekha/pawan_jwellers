import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'package:number_to_indian_words/number_to_indian_words.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
// import 'package:flutter/services.dart' show rootBundle;

import 'invoice.dart';

Future<Uint8List> makePdf(Invoice? invoice, String address, String name,
    List listItem, documentType, documentNumber) async {
  var box = await Hive.openBox('myBox');
  int index = box.get('index') ?? 0;

  box.put('index', index + 1);

  double amountBeforeTax = 0;
  int s = 1;
  final pdf = Document();
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/logo.jpg')).buffer.asUint8List());
  pdf.addPage(
    Page(
      pageFormat: PdfPageFormat.a3,
      orientation: PageOrientation.landscape,
      build: (context) {
        return Container(
            height: 900,
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Stack(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, bottom: 2, right: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("GSTN : 07EHLPK3504B1ZP",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text("Tax Invoicee",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),

                                Text("OriginalRecepient",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16)),
                                // ${
                              ]))),
                  Container(
                      alignment: Alignment.center,
                      child: Text("JAI SHREE JEWELLERS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          //   invoice.customer
                          //   }

                          Text("  Mobile:8826144604\n              8076086281",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("  $documentType:$documentNumber",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      Image(
                        imageLogo,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                      Text(
                          "Shop No:3,L-Extension,287/288,\nSom Bazar Rod,Mohan Garden,\nUttam Nagar,New Delhi-110059",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14)),
                    ],
                  ),
                  Container(height: 10),
                  Row(children: [
                    Flexible(
                        flex: 5,
                        child: Container(
                          height: 80,
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 2, bottom: 2, right: 5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Customer Name:$name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Text(address,
                                        // overflow: TextOverflow.span,
                                        // textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14)),
                                  ]),
                            ),
                          ]),
                        )),
                    Flexible(
                        flex: 2,
                        child: Container(
                          height: 80,
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 2, bottom: 2, right: 55),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Date:${DateTime.now().toString().replaceRange(11, 26, "")}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Text("Invoice No:${index}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16)),
                                    Text("Payment Mode: ${listItem[0][4]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16)),
                                  ]),
                            ),
                          ]),
                        )),
                  ]),
                  Container(height: 30),
                  Table(
                    border: TableBorder.all(color: PdfColors.black),
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            child: Text(
                              'S. No.',
                              style: Theme.of(context).header4,
                              textAlign: TextAlign.center,
                            ),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                          ),
                          Padding(
                            child: Text(
                              'Description of Goods',
                              style: Theme.of(context).header4,
                              textAlign: TextAlign.center,
                            ),
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 2, right: 2),
                          ),
                          Padding(
                            child: Text(
                              'HSN ',
                              style: Theme.of(context).header4,
                              textAlign: TextAlign.center,
                            ),
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 2, right: 2),
                          ),
                          Padding(
                            child: Text(
                              'Qty./Unit',
                              style: Theme.of(context).header4,
                              textAlign: TextAlign.center,
                            ),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                          ),
                          Padding(
                            child: Text(
                              'Gross wt.\n(gm)',
                              style: Theme.of(context).header4,
                              textAlign: TextAlign.center,
                            ),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                          ),
                          Padding(
                            child: Text(
                              'Net wt.\n(gm)',
                              style: Theme.of(context).header4,
                              textAlign: TextAlign.center,
                            ),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                          ),
                          Padding(
                            child: Text(
                              'Purity\nSpecs.',
                              style: Theme.of(context).header4,
                              textAlign: TextAlign.center,
                            ),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                          ),
                          Padding(
                            child: Text(
                              'Rate',
                              style: Theme.of(context).header4,
                              textAlign: TextAlign.center,
                            ),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              'Amount',
                              style: Theme.of(context).header4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      ...listItem.map(
                        (listItem) => TableRow(
                          children: [
                            Expanded(
                              child: paddedText("${s++}"),
                              flex: 1,
                            ),
                            Expanded(
                              child:
                                  paddedText("${listItem[2]} ${listItem[0]}"),
                              flex: 2,
                            ),
                            Expanded(
                              child: paddedText("${listItem[6]}"),
                              flex: 1,
                            ),
                            Expanded(
                              child: paddedText("${listItem[3]}"),
                              flex: 1,
                            ),
                            Expanded(
                              child: paddedText("${listItem[1]}"),
                              flex: 1,
                            ),
                            Expanded(
                              child: paddedText("${listItem[1]}"),
                              flex: 1,
                            ),
                            Expanded(
                              child: paddedText("${listItem[7]}"),
                              flex: 1,
                            ),
                            Expanded(
                              child: paddedText("${listItem[5]}"),
                              flex: 1,
                            ),
                            Expanded(
                              child: paddedText(
                                  "${double.parse(listItem[5]) * double.parse(listItem[1]) * double.parse(listItem[3])}"),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                          // alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(bottom: 10, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Terms & Conditions:",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    // color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                                // textAlign: TextAlign.left,
                              ),
                              Text(
                                "1.Goods once sold will not be taken back",
                                style: TextStyle(
                                    // color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                // textAlign: TextAlign.left,
                              ),
                              Text(
                                "2.Our risk and responsibility ceses as soon as the goods leave our premises.",
                                style: TextStyle(
                                    // color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                // textAlign: TextAlign.left,
                              ),
                              Text(
                                "3.Subject to Delhi Judisdiction only E.&.O.E",
                                style: TextStyle(
                                    // color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                // textAlign: TextAlign.left,
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Amount Before Tax : ",
                                                style: TextStyle(
                                                    // color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.left,
                                              ),
                                              ...listItem.map((listItem) {
                                                print(
                                                    "${amountBeforeTax = amountBeforeTax + double.parse(listItem[5]) * double.parse(listItem[1])}");
                                                return Text(
                                                  "${amountBeforeTax = amountBeforeTax + double.parse(listItem[5]) * double.parse(listItem[1])}",
                                                  style: TextStyle(
                                                      // color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left,
                                                );
                                              }),
                                              // Text(
                                              //   amountBeforeTax.toStringAsFixed(2),
                                              // )
                                            ],
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                              // crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "CGST @ 1.5% : ",
                                                  style: TextStyle(
                                                      // color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  "SGST @ 1.5% : ",
                                                  style: TextStyle(
                                                      // color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ]),
                                          Column(
                                              // crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  ((1.5 / 100) *
                                                          amountBeforeTax)
                                                      .toStringAsFixed(2),
                                                  style: TextStyle(
                                                      // color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  ((1.5 / 100) *
                                                          amountBeforeTax)
                                                      .toStringAsFixed(2),
                                                  style: TextStyle(
                                                      // color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ]),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Total : ",
                                            style: TextStyle(
                                                // color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            ((3 / 100) * amountBeforeTax +
                                                    amountBeforeTax)
                                                .toStringAsFixed(2),
                                            style: TextStyle(
                                                // color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ])
                              ])),
                    ],
                  ),
                ]),

                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(top: 10, bottom: 150),
                  child: Divider(
                    height: 1,
                    borderStyle: BorderStyle.solid,
                  ),
                ),
                Container(
                    alignment: Alignment.bottomLeft,
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 115),
                    child: Row(
                        // mainAxisAlignment:
                        //     MainAxisAlignment.end,
                        children: [
                          Text(
                            "AMOUNT IN WORDS: ",
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            NumToWords.convertNumberToIndianWords(
                                    ((3 / 100) * amountBeforeTax +
                                            amountBeforeTax)
                                        .toInt())
                                .toUpperCase(),
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left,
                          )
                        ])),

                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Divider(
                    height: 1,
                    borderStyle: BorderStyle.solid,
                  ),
                ),

                Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(top: 10, bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Customer Signature",
                          style: TextStyle(
                              // color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "For JAI SHREE JWELLERS",
                          style: TextStyle(
                              // color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(top: 10, bottom: 40),
                  child: Divider(
                    height: 1,
                    borderStyle: BorderStyle.solid,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: Text(
                    "THANK YOU! VISIT AGAIN",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).header2,
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                // Text(
                //     "Please forward the below slip to your accounts payable department."),
              ],
            ));
      },
    ),
  );
  return pdf.save();
}

Widget paddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
