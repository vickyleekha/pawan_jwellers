import 'package:flutter/material.dart';

class ViewItem extends StatefulWidget {
  List listItem;
  ViewItem({super.key, required this.listItem});

  @override
  State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.listItem.length,
          itemBuilder: (context, index) {
            return Text(widget.listItem[index][0]);
          }),
    );
  }
}
