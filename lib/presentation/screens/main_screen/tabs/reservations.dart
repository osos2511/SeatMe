import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class Reservations extends StatelessWidget {
  final List<Map<String, dynamic>> reservedTables = [
    {"tableNumber": 1, "seats": 4, "status": "محجوزة", "name": "أحمد"},
    {"tableNumber": 3, "seats": 2, "status": "محجوزة", "name": "سارة"},
    {"tableNumber": 5, "seats": 6, "status": "محجوزة", "name": "محمد"},
  ];

   Reservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Reserved Tables',style:TextStyle(color:  ColorApp.secondaryColor2,fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: reservedTables.length,
        itemBuilder: (context, index) {
          final table = reservedTables[index];
          return Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.table_bar, size: 32),
              title: Text("طاولة رقم ${table['tableNumber']}"),
              subtitle: Text("عدد المقاعد: ${table['seats']}\nبواسطة: ${table['name']}"),
              trailing: Text(
                table['status'],
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}