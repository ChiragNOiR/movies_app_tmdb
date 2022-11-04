import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorBody extends ConsumerWidget {
  const ErrorBody(
    this.provider, {
    Key? key,
    required this.message,
  }) : super(key: key);
  final provider;
  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () => ref.refresh(provider),
            child: const Text("Try again"),
          ),
        ],
      ),
    );
  }
}
