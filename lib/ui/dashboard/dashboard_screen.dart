import 'package:attendance_app/provider/data_table_provider.dart';
import 'package:attendance_app/ui/dashboard/component/build_drawer.dart';
import 'package:attendance_app/ui/dashboard/component/build_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  static final String routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text(
          'Dashboard',
          style: TextStyle(color: Color(0xFFFD6C6E), letterSpacing: 2),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              backgroundImage: AssetImage('assets/images/profile_pic.png'),
              radius: 40,
            ),
          ),
        ],
      ),
      drawer: BuildDrawer(),
      body: ChangeNotifierProvider<DataTableProvider>(
        create: (context) => DataTableProvider(),
        child: Consumer<DataTableProvider>(
          builder: (context, provider, child) {
            if (provider.getTabelData == null) {
              provider.getData(context);
              return Center(child: CircularProgressIndicator());
            }
            return BuildTable(results: provider.getTabelData.results);
          },
        ),
      ),
    );
  }
}
