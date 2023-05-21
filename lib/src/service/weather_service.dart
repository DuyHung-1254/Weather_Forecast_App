// import 'package:flutter/foundation.dart';
import 'package:thirty_widgets/src/api/api_repository.dart';
import 'package:thirty_widgets/src/model/current_weather_data.dart';
import 'package:thirty_widgets/src/model/five_days_data.dart';

class WeatherService { // lấy api thông qua tham số city
  final String city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=0919e9e15744cef8c5e5400784082a6e';

  WeatherService({required this.city});

  void getCurrentWeatherData({
    Function() ?beforSend,
    Function(CurrentWeatherData currentWeatherData) ?onSuccess,
    Function(dynamic error) ?onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    // sử dụng get đến url api để lấy dữ liệu 
      ApiRepository(url: '$url').get(
        onSuccess: (data) => {  // nếu có dữ liệu sẽ truyền vào hàm Current...
              onSuccess!(CurrentWeatherData.fromJson(data)),
            },
            
            );
  }

  void getFiveDaysThreeHoursForcastData({
    required Function(List<FiveDayData> fiveDayData) onSuccess,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepository(url: '$url').get(
        onSuccess: (data) => {
              onSuccess((data['list'] as List)
                      .map((t) => FiveDayData.fromJson(t))
                      .toList()),
            },

            );
  }
}
