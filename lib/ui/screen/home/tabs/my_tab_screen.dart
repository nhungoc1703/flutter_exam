import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class HomeMyScreen extends StatefulWidget {
  const HomeMyScreen({super.key});

  @override
  State<HomeMyScreen> createState() => _HomeMyScreenState();
}

class _HomeMyScreenState extends State<HomeMyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
