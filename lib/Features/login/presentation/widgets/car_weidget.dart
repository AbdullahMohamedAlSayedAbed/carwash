import 'package:flutter/material.dart';

class CarItemWidget extends StatelessWidget {
  final String carName;
  final String carImage;
  final String? selectedCar;
  final VoidCallback onSelect;

  const CarItemWidget({
    Key? key,
    required this.carName,
    required this.carImage,
    required this.selectedCar,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedCar == carName ? Colors.orange : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                carName,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Row(
              children: [
                Image.network(
                  carImage,
                  width: 80,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
                const SizedBox(width: 10),
                Radio(
                  value: carName,
                  groupValue: selectedCar,
                  onChanged: (value) {
                    onSelect();
                  },
                  activeColor: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
