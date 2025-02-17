part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserEntity user;
  SignUpSuccess({required this.user});

}
final class SignUpFailler extends SignUpState {
  final String message;
  SignUpFailler({required this.message});
}
