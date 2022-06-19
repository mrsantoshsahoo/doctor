part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class GetDoctorList extends HomeEvent{

  @override
  List<Object?> get props => [];

}
