import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class HomeFullScreen extends StatefulWidget {
  const HomeFullScreen({super.key});

  @override
  State<HomeFullScreen> createState() => _HomeFullScreenState();
}

class _HomeFullScreenState extends State<HomeFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
