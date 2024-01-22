import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/common/button_outline.dart';

import 'package:mobile_app/widgets/common/section_title.dart';

class AlertMessage extends StatefulWidget {
  final String request;
  const AlertMessage({super.key,required this.request});

  @override
  State<AlertMessage> createState() => _AlertMessageState();
}

class _AlertMessageState extends State<AlertMessage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // shape:  const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      // shape: Border.all( color: Colors.red),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
            color: Colors.amber,
            width: 3,
            strokeAlign: BorderSide.strokeAlignCenter),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      elevation: 5,
      icon: const Icon(Icons.help_outline_rounded, color: Colors.amber),
      title:  const SectionTitle(title: 'Accept request?', size: 15),
      // contentTextStyle: TextStyle(),
      backgroundColor: Colors.white,
  alignment: Alignment.center,
      content: Container(
        height: 20,
        alignment: Alignment.center,
        // width: double.infinity,
        child:  SectionTitle(title: 'For: ${widget.request}',size: 12,),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,

      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            overlayColor:
                MaterialStateProperty.all(Color.fromARGB(0, 91, 83, 59)),
            enableFeedback: true,
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(0, 255, 255, 255),
            ),
          ),
          onPressed: () => Navigator.pop(context, 'No'),
          child: const SectionTitle(title: 'No', size: 15),
        ),
        CustomOutlinedButton(
          text: 'Yes',
          // key: Key(''),
          bgColor: Colors.amber,
          color: Colors.amber,
          handlePress: () => Navigator.pop(context, 'Yes'),
        ),

        // TextButton(
        //   onPressed: () => Navigator.pop(context, 'Yes'),
        //   child: const Text('Yes'),
        // ),
      ],
    );
  }
}
