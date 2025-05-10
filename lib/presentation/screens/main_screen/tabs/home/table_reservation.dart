import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/theme/colors.dart';



class TableReservation extends StatefulWidget {
  const TableReservation({super.key});

  @override
  _TableReservationState createState() => _TableReservationState();
}

class _TableReservationState extends State<TableReservation> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int numberOfTables = 1;

  DateTime? _focusedDay;
  DateTime _selectedDay = DateTime.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  void _confirmReservation() {
    if (selectedDate != null && selectedTime != null) {
      final formattedDate =
          "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
      final formattedTime = selectedTime!.format(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '$numberOfTables table(s) reserved on $formattedDate at $formattedTime',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date and time')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title:  Text('Table Reservation',style: GoogleFonts.inter(color:Colors.white,fontWeight: FontWeight.w500),),
        centerTitle: true,

        backgroundColor: ColorApp.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1. Calendar (Date Picker)
            TableCalendar(
              daysOfWeekHeight: 22,
              focusedDay: _focusedDay ?? _selectedDay,
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarStyle: const CalendarStyle(
                defaultTextStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorApp.secondaryColor1,
                ),
                todayDecoration: BoxDecoration(
                  color: ColorApp.secondaryColor1,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: ColorApp.secondaryColor1,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                titleTextStyle: TextStyle(
                  color: ColorApp.secondaryColor1,
                  fontWeight: FontWeight.w600,
                ),
                titleCentered: true,
                formatButtonVisible: false,
              ),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  selectedDate = selectedDay;
                });
              },
            ),

            const SizedBox(height: 20),

            // 2. Select time
            ListTile(
              contentPadding: EdgeInsets.only(left: 0),
              title: Text(
                selectedTime == null ? 'Select time' : selectedTime!.format(context),
                style: TextStyle(
                  color: ColorApp.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(Icons.access_time),
              onTap: () => _selectTime(context),
            ),

            const SizedBox(height: 10),

            // 3. Number of tables
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Number of tables:', style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      color: ColorApp.primaryColor,
                      onPressed: numberOfTables > 1
                          ? () {
                        setState(() {
                          numberOfTables--;
                        });
                      }
                          : null,
                    ),
                    Text(
                      '$numberOfTables',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: ColorApp.primaryColor,
                      onPressed: numberOfTables < 10
                          ? () {
                        setState(() {
                          numberOfTables++;
                        });
                      }
                          : null,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Confirm button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(120, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)
                ),
                backgroundColor: ColorApp.primaryColor,
                foregroundColor: Colors.grey,
              ),
              onPressed: (selectedDate != null && selectedTime != null)
                  ? _confirmReservation
                  : null,
              child:  Text('Confirm Reservation',style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
