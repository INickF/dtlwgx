import 'package:dtlwgx/models/car/car.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [_buildId(), _buildCred(), _buildAvail()],
        ),
      ),
    );
  }

  Widget _buildId() {
    return Container(
      margin: const EdgeInsets.all(6),
      child: Row(
        children: [
          const Icon(
            Icons.alternate_email_rounded,
            color: Colors.blue,
            size: 28,
          ),
          Text(
            car.id.toString(),
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCred() {
    return Container(
      margin: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(car.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              const SizedBox(width: 5),
              Text(car.model, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300))
            ],
          ),
          Text("VIN: ${car.vin}"),
          Row(
            children: [
              const Text(
                "Car price: ",
                style: TextStyle(fontSize: 16),
              ),
              Text(car.price.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  )),
              const Icon(
                Icons.monetization_on_outlined,
                size: 24,
                color: Colors.lightBlue,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAvail() {
    return Align(
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Column(
          children: [
            car.availability
                ? const Icon(
                    Icons.check,
                    size: 28,
                    color: Colors.lightBlue,
                  )
                : Icon(
                    Icons.block,
                    size: 28,
                    color: Colors.amber.shade600,
                  ),
            car.availability
                ? const Text(
                    "Available",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 18),
                  )
                : Text(
                    "Out",
                    style: TextStyle(color: Colors.amber.shade600, fontSize: 18),
                  )
          ],
        ),
      ),
    );
  }
}
