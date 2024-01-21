import 'package:flutter/material.dart';

class AlertMessage extends StatefulWidget {
  const AlertMessage({super.key});

  @override
  State<AlertMessage> createState() => _AlertMessageState();
}

class _AlertMessageState extends State<AlertMessage> {
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
      
      
  }
}