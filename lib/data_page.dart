import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDataPageState createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  late SupabaseClient _supabaseClient;
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _supabaseClient = SupabaseClient(
      'API URL', //API URL Supabase paste here
      'API KEY', //API key Supabase paste here
    );
    fetchData();
  }

  Future<void> fetchData() async {
    // ignore: deprecated_member_use
    var response = await _supabaseClient
        // Insert your table here
        .from('your_table_here')
        .select()
        // ignore: deprecated_member_use
        .execute();
    setState(() {
      _data = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(_data[index]['username']),
              ),
              subtitle: Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(_data[index]['password']),
              ),
            ),
          );
        },
      ),
    );
  }
}
