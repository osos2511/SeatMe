import 'package:flutter/material.dart';
import 'package:seatme/core/theme/colors.dart';

void showSuccessDialog(BuildContext context, String message, String nextRoute) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      titlePadding: EdgeInsets.zero,
      title: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorApp.primaryColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: ColorApp.primaryColor, size: 24),
            ),
            const SizedBox(width: 12),
            const Text(
              "Success",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorApp.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pop(context); // close dialog first
              Navigator.pushReplacementNamed(context, nextRoute); // then navigate
            },
            child: const Text(
              "OK",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
