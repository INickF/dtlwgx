import 'package:get/get.dart';

import '../models/car/car.dart';
import '../services/car_service.dart';

class CarController extends GetxController {
  final _cars = <Car>[].obs;
  final service = CarService();

  RxList<Car> get cars => _cars;

  @override
  void onInit() {
    getCarsCtrl();
    super.onInit();
  }

  void getCarsCtrl() async {
    List<Car>? newCars = await service.getCars();

    if (newCars == null) {
      Get.snackbar("Error", "Unable to load data :(");
      return null;
    }

    _cars.addAll(newCars);
  }
}
