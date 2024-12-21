import 'package:flutter/material.dart';

Widget customTextFeildWithGrayAlert({
  required hintText,
  required TextEditingController controller,
  required bool readOnly,
}) {
  return TextFormField(
      controller: controller,
      autofocus: false,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hintText ?? "No",
        hintStyle: const TextStyle(
            fontFamily: "DMSans",
            fontSize: 14,
            color: Color.fromRGBO(203, 210, 217, 1),
            fontWeight: FontWeight.w500),
        fillColor: const Color.fromRGBO(
          246,
          247,
          248,
          1,
        ),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide:
              BorderSide(width: 1, color: Color.fromRGBO(203, 210, 217, 1)),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide:
              BorderSide(width: 1, color: Color.fromRGBO(203, 210, 217, 1)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide:
              BorderSide(width: 1, color: Color.fromRGBO(203, 210, 217, 1)),
        ),
      ));
}

Widget customTextFeildWithGrayMultiline({
  required hintText,
  required TextEditingController controller,
  required bool readOnly,
  // String labelText,
}) {
  return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      autofocus: false,
      readOnly: readOnly,
      decoration: InputDecoration(
        // labelText: labelText,
        hintText: hintText ?? "No",
        hintStyle: const TextStyle(
            fontFamily: "DMSans",
            fontSize: 14,
            color: Color.fromRGBO(203, 210, 217, 1),
            fontWeight: FontWeight.w500),
        fillColor: const Color.fromRGBO(
          246,
          247,
          248,
          1,
        ),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide:
              BorderSide(width: 1, color: Color.fromRGBO(203, 210, 217, 1)),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide:
              BorderSide(width: 1, color: Color.fromRGBO(203, 210, 217, 1)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide:
              BorderSide(width: 1, color: Color.fromRGBO(203, 210, 217, 1)),
        ),
      ));
}

// Widget customTextFeildWith({
//   String hintText,
//   TextEditingController controller,
// }) {
//   return TextFormField(
//       controller: controller,
//       autofocus: false,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: TextStyle(
//             fontFamily: "DMSans",
//             fontSize: 14,
//             color: Colors.black,
//             fontWeight: FontWeight.w500),
//         fillColor: Color.fromRGBO(250, 250, 250, 1),
//         filled: true,
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//               width: 1, color: Color.fromRGBO(233, 233, 233, 1)),
//         ),
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//               width: 1, color: Color.fromRGBO(233, 233, 233, 1)),
//         ),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(
//               width: 1, color: Color.fromRGBO(233, 233, 233, 1)),
//         ),
//       ));
// }

// Widget customTextFeildWithGray({
//   String hintText,
//   TextEditingController controller,
//   bool readOnly,
//   String labelText,
// }) {
//   return TextFormField(
//       controller: controller,
//       autofocus: false,
//       readOnly: readOnly,
//       decoration: InputDecoration(
//         labelText: labelText,
//         hintText: hintText == null ? "No" : hintText,
//         hintStyle: TextStyle(
//             fontFamily: "DMSans",
//             fontSize: 14,
//             color: Colors.grey.shade500,
//             fontWeight: FontWeight.w500),
//         fillColor: Colors.grey.shade100,
//         filled: true,
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(4.0)),
//           borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
//         ),
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(4.0)),
//           borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(4.0)),
//           borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
//         ),
//       ));
// }

// Widget customTextField({String text, fontSize}) {
//   return Text(
//     text,
//     style: TextStyle(
//         fontFamily: "DMSans",
//         color: Colors.black,
//         fontWeight: FontWeight.w700,
//         fontSize: fontSize.toDouble()),
//   );
// }

// dropDownDecoration() => InputDecoration(
//     fillColor: Color.fromRGBO(250, 250, 250, 1),
//     filled: true,
//     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//     enabledBorder: OutlineInputBorder(
//         borderSide:
//             BorderSide(color: Color.fromRGBO(255, 166, 158, 1), width: 1.0)));

Widget customTextFieldW500({required String text, required double fontSize}) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: "DMSans",
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: fontSize.toDouble()),
  );
}

Widget customTextFieldWhite(
    {required String text,
    required double fontSize,
    required FontWeight fontWeight}) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: "DMSans",
        color: Colors.white,
        fontWeight: fontWeight,
        fontSize: fontSize),
  );
}
