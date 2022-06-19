import 'dart:convert';
import '../../../app_helper/app_local_database_helper/field_constants.dart';
import '../../../app_helper/app_local_database_helper/mycash_database.dart';
import '../../../app_helper/app_local_database_helper/name_constants.dart';
import '../../model/doctor_list_model.dart';

class HomeLocalDataSource {
  final database = DatabaseService.getInstance();

  static HomeLocalDataSource? _instance;

  static HomeLocalDataSource getInstance() {
    _instance ??= HomeLocalDataSource();
    return _instance!;
  }
Future<void> insertDoctor(List<DoctorList> doctor) async {
  try {
    doctor.forEach((element) async{
      await database.insert(
        NameConstants.SAVING_TABLE,
        {
          FieldConstants.createdTimeStamp: element.id,
          FieldConstants.data:  JsonEncoder().convert(element.toJson())
        },
      );
    });

  } catch (e) {
    rethrow;
  }
}
  Future<List<DoctorList>> fetchDoctor() async {
    try {
      var result = await database.queryAllRows(NameConstants.SAVING_TABLE);
      List<DoctorList> finalData = List.generate(
        result != null ? result.length : 0,
            (index) {
          Map<String, dynamic> order = result[index];
          String data = order[FieldConstants.data];
          Map<String, dynamic> valueMap = jsonDecode(data);
          var orderFromDb = DoctorList.fromJson(valueMap);
          return orderFromDb;
        },
      );
      return finalData;
    } catch (e) {
      rethrow;
    }
  }

}