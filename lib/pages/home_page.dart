import 'package:dtlwgx/controllers/car_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/car/car.dart';
import '../widgets/car_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(CarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Center(
          child: Column(
            children: [
              _buildHeader(),
              _buildBody(),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: Get.height * 0.2,
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blueAccent, Colors.cyan]),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: const Center(
        child: Text(
          "List of cars",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (controller.cars.isEmpty) {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: const CircularProgressIndicator(
            color: Colors.lightBlue,
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: controller.cars.length,
        itemBuilder: (BuildContext context, index) {
          Car curCar = controller.cars[index];
          return CarCard(car: curCar);
        },
      ),
    );
  }
}
