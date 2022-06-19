import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../app_helper/app_remote_helper/http_network.dart';
import '../../data/model/doctor_list_model.dart';
import '../../data/repository/home/home_repository.dart';
import '../../data/repository/home/saving_localstore.dart';
import '../../utils/connection.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  final _homeLocalStore = HomeLocalDataSource.getInstance();

  HomeBloc(this._homeRepository) : super(HomeInitial()) {
    on<GetDoctorList>((event, emit) async {
      emit(HomeDataloading());
      try {
        var data = await _homeRepository.getDoctorsData();
        await _homeLocalStore.insertDoctor(data);
        var result= await _homeLocalStore.fetchDoctor();
        emit(HomeDataload(list: result));

      } catch (e) {
        print("call 4");
        emit(HomeError());
      }
    });
  }
}
