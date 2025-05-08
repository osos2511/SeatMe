import 'package:flutter/material.dart';
import 'package:seatme/core/theme/colors.dart';
import 'package:seatme/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
   bool isDarkMode = false;
  bool isNotificationsEnabled = true;
   Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
    //  isDarkMode = prefs.getBool('isDarkMode') ?? false;
      isNotificationsEnabled = prefs.getBool('isNotificationsEnabled') ?? true;
    });
  }

  Future<void> _updateSettings(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  // void _toggleDarkMode(bool value) async {
  //   setState(() {
  //     isDarkMode = value;
  //   });
  //   await _updateSettings('isDarkMode', value);
  //   MyApp.restartApp(context, value);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Settings",style:TextStyle(color:  ColorApp.secondaryColor2,fontWeight: FontWeight.bold)),
        elevation: 0,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
       buildListTile("Edit Profile", Icons.person, onTap: () {}),
Divider(),
buildListTile("Notifications", Icons.notifications,
    switchValue: isNotificationsEnabled,
    onSwitchChanged: (value) {
      setState(() {
        isNotificationsEnabled = value;
      });
      _updateSettings('isNotificationsEnabled', value);
    }),
Divider(),
// buildListTile("Dark Mode", Icons.dark_mode,
//     switchValue: isDarkMode, onSwitchChanged: _toggleDarkMode),
buildListTile("Language", Icons.language, onTap: () {

}),
Divider(),

buildListTile("Logout", Icons.logout, onTap: () {}),
Divider(),
buildListTile("Help", Icons.help, onTap: () {}),
Divider(),

buildListTile("About Us", Icons.info, onTap: () {}),

          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title, IconData icon,
      {VoidCallback? onTap, bool? switchValue, Function(bool)? onSwitchChanged}) {
    return ListTile(
      leading: Icon(icon, color: ColorApp.secondaryColor2),
      title: Text(title),
      trailing: switchValue != null
          ? Switch(
              value: switchValue,
              onChanged: (value) {
                if (onSwitchChanged != null) {
                  onSwitchChanged(value);
                }
              },
              activeColor: ColorApp.secondaryColor1,
            )
          : Icon(Icons.arrow_forward, color: ColorApp.secondaryColor1),
      onTap: onTap,
    );
  }
}