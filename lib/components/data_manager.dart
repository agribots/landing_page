import 'package:http/http.dart' as http;
import "dart:convert";

class Tutor {
  final String id;
  final String name;
  final String email;
  final String dp;
  final String insta;
  final Map<String, List<dynamic>> available;

  Tutor({
    this.id = 'NULL',
    this.name = 'NULL',
    this.email = 'NULL',
    this.dp = 'NULL',
    this.insta = 'NULL',
    this.available = const {},
  });

  toString() {
    return 'Tutor(id: $id, name: $name, email: $email, image: $dp, insta: $insta, available: $available)';
  }
}

class DataManager {
  // Class that fetches data from the server and stores it in a Map<String, dynamic> object

  static List<Tutor> teachers = [];
  static List<Map<String, dynamic>> _data = [];
  static String apiURL = "http://localhost:5000/api/v1";

  static Future<String> fetchTeachers() async {
    try {
      await http.get(Uri.parse("${apiURL}/teacher/all")).then((response) {
        if (response.statusCode == 200) {
          _data = List<Map<String, dynamic>>.from(jsonDecode(response.body));
          teachers = _data
              .map((e) => Tutor(
                  id: e['id'],
                  email: e['email'],
                  name: e['name'],
                  dp: e['dp'],
                  insta: e['insta'],
                  available: Map<String, List<dynamic>>.from(
                      json.decode(e['available']))))
              .toList();
        } else {
          throw "Error response from server: ${response.statusCode}";
        }
      });
      // print(teachers[0]);
      return "OK";
    } catch (e) {
      print(e);
    }
    throw "Error fetching data from server";
  }
}

main() {
  DataManager.fetchTeachers();
}
