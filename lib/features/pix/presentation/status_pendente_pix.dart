import 'package:flutter/material.dart';

class StatusPendentePix extends StatelessWidget {
  const StatusPendentePix({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}