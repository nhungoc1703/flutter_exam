import 'package:flutter/material.dart';

import '../../widget/app_appbar.dart';
import '../../widget/app_text_form_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppAppBar(
          title: 'Tìm kiếm',
          leadingBack: false,
          leadingIcon: null,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: ApppTextFormField(
          textController: _textSearch,
          hintTitle: 'Tìm kiếm',
          textInputTypeTitle: TextInputType.text,
          obscure: false,
          readFormField: null,
          prefixIcon: const Icon(
            Icons.search_outlined,
            size: 25,
          ),
          suffixIcon: null,
        ),
      ),
    );
  }
}
