import 'dart:math';

class Uuid {
  String v4() {
    final random = Random();
    return '${_randomHex(8, random)}-${_randomHex(4, random)}-${_randomHex(4, random)}-${_randomHex(4, random)}-${_randomHex(12, random)}';
  }

  String _randomHex(int length, Random random) {
    const chars = '0123456789abcdef';
    return List.generate(length, (_) => chars[random.nextInt(16)]).join();
  }
}