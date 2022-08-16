import 'package:flutter/material.dart';
import 'package:task/view/home/widgets/search.dart';

AppBar ourAppBar() {
  return AppBar(
    toolbarHeight: 80,
    title: const Text(
      "WOOKIE\nMOVIES",
      style: TextStyle(fontSize: 24),
    ),
    actions: [Search()],
  );
}
