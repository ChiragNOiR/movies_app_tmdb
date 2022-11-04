import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MaterialButton(
            child:
                const Text('No Matched Found!!! Search using correct keyword.'),
            onPressed: () =>
                showToast("Show Long Toast", duration: Toast.lengthLong)),
      ),
    );
  }

  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}
