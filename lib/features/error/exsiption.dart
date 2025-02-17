class exsiption implements Exception{
  final String message;

  exsiption({required this.message});
  @override
  String toString() {
    return message;
  }
  
}