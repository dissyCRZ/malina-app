import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class GeocodingService {
  static Future<String> getGeocodingString(
      double latitude, double longitude) async {
    const apiKey = 'e5e34672-4a2c-4d57-b70b-4aacf79a463c';
    final url =
        'https://geocode-maps.yandex.ru/1.x/?geocode=$longitude,$latitude&format=json&apikey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      log(response.body.toString());
      if (response.statusCode == 200) {
        final jsonResult = json.decode(response.body);
        final featureMember =
            jsonResult['response']['GeoObjectCollection']['featureMember'];

        if (featureMember.isNotEmpty) {
          final geocodingString = featureMember[0]['GeoObject']
              ['metaDataProperty']['GeocoderMetaData']['text'];
          return geocodingString;
        }
      }
    } catch (e) {
      log('Geocoding error: $e');
    }

    return 'Неизвестный';
  }
}
