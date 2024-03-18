import 'package:flutter/material.dart';

class UnknowPage extends StatelessWidget {

  static String routeName = '/unkowpage';

  final String pageName;

  const UnknowPage({
    super.key,
    required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return Text('The page "$pageName" not found.');
  }
}