import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  final Color color;
  final String text;
  const Loading({super.key,required this.color,required this.text});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return   Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircularProgressIndicator(
                                          color:widget.color,
                                        ),
                                        const SizedBox(width: 20),
                                        Text(widget.text),
                                      ],
                                    ),
                                  ),
                                );
  }
}
