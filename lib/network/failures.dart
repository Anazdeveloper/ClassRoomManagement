import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure();

  @override
  List<Object> get props => [];
}

class ApiError extends Failure {
  final String? title;
  final String? message;
  ApiError({this.title,this.message}) : super();
}