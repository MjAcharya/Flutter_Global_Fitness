import 'package:globo_fitness/Data/wheather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  String domain = 'api.openweathermap.org';
  String path = 'data/2.5/weather';
  String apiKey = '5d8bcafeb09823f4f77fdd3802e2e0b8';

  Future<Wheather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};

    Uri uri = Uri.https(domain, path, parameters);

    http.Response result = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(result.body);
    Wheather resultSet = Wheather.toJsonFormat(data);
    return resultSet;
  }
}
