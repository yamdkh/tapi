// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:new_york/main.dart';
import 'package:new_york/repository/most_post_repo.dart';

void main() {
  test('Test Post API Productions ', () async {
    final postRepo = PostRepository(AppMode.development);
    var s = await postRepo.getMostPost();
    expect(s?.status ?? "No", "OK");
  });



}
