import 'package:flutter/material.dart';

import 'package:pawan_jwellers/util.dart';
import 'package:printing/printing.dart';

import 'invoice.dart';

class PdfPreviewPage extends StatelessWidget {
  final Invoice? invoice;
  final String address;
  final String name;
  final String documentType;
  final String documentNumber;
  final List listItem;
  const PdfPreviewPage(
      {Key? key,
      this.invoice,
      required this.address,
      required this.name,
      required this.listItem,
      required this.documentType,
      required this.documentNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(
            invoice, address, name, listItem, documentType, documentNumber),
      ),
    );
  }
}
