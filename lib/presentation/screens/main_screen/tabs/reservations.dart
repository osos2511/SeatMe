import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class Reservations extends StatelessWidget {
  final List<Map<String, dynamic>> reservedTables = [
    {"tableNumber": 1, "seats": 4, "status": "Reserved", "name": "Ahmed"},
    {"tableNumber": 3, "seats": 2, "status": "Reserved", "name": "Sara"},
    {"tableNumber": 5, "seats": 6, "status": "Reserved", "name": "Mohamed"},
  ];

  Reservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Reserved Tables',
          style: TextStyle(
            color: ColorApp.secondaryColor2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: reservedTables.length,
        itemBuilder: (context, index) {
          final table = reservedTables[index];
          return Card(
            color: Colors.white,
            shadowColor: ColorApp.secondaryColor2,
            elevation: 8,
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.table_bar,
                    size: 32,
                    color: ColorApp.secondaryColor1,
                  ),
                ],
              ),
              title: Text(
                "Table No. ${table['tableNumber']}",
                style: TextStyle(color: ColorApp.secondaryColor2,fontWeight: FontWeight.bold,),
              ),
              subtitle: Text(
                "Seats: ${table['seats']}\nReserved by: ${table['name']}",
                style: TextStyle(color: ColorApp.secondaryColor2),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    table['status'],
                    style: TextStyle(
                      color: ColorApp.secondaryColor1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
