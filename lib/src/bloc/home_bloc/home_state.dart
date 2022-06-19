part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {

  @override
  List<Object?> get props => [];
}
class HomeDataloading extends HomeState{
  HomeDataloading();
  @override
  List<Object?> get props => [];
}
class HomeDataload extends HomeState{
  final List<DoctorList> list;
  HomeDataload({required this.list});
  @override
  List<Object?> get props => [this.list];
}
class HomeError extends HomeState{
  HomeError();
  @override
  List<Object?> get props => [];
}

