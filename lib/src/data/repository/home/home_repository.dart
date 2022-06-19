import '../../model/doctor_list_model.dart';
import 'package:http/http.dart' as http;
class HomeRepository {
  final String _baseUrl = "https://5efdb0b9dd373900160b35e2.mockapi.io/contacts";

  Future<List<DoctorList>> getDoctorsData() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      print(response.body.toString());
      return doctorListFromJson(response.body);
    } else {
      throw Exception("Failed to load joke");
    }
  }
}