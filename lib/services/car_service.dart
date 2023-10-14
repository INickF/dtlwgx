import 'package:dio/dio.dart';

import '../models/car/car.dart';

class CarService {
  final String _url = "https://myfakeapi.com/api/cars";
  final Dio _client = Dio();

  CarService() {
    _client.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        return handler.next(e);
      },
    ));
  }

  Future<List<Car>?> getCars() async {
    Response dataReceived = await _client.get(_url);

    if (dataReceived.statusCode != 200) return null;

    List<dynamic> carData = dataReceived.data["cars"];
    List<Car> cars = carData.map((obj) => Car.fromJson(obj)).toList();
    return cars;
  }
}
