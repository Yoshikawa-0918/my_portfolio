import 'package:flutter_riverpod/flutter_riverpod.dart';

final durationProvider = Provider((ref) {
  Duration duration = const Duration(milliseconds: 500);
  return duration;
});
