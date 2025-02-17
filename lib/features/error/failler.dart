abstract class Failler {
    final String message;

  Failler({required this.message});

}
class ServerFailler extends Failler {
  ServerFailler({required super.message});
}