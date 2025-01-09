import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {"name": "John Doe", "message": "Hello! How are you?"},
    {"name": "Jane Smith", "message": "Are you available for a call?"},
    {"name": "Emily Johnson", "message": "Thank you for your help!"},
    {"name": "Michael Brown", "message": "Let's catch up soon."},
    {"name": "Sarah Wilson", "message": "Can you share the document?"},
    {"name": "David Lee", "message": "Great work on the project!"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: Colors.blueAccent, // Warna latar belakang
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0), // Margin antar card
            child: Card(
              elevation: 2, // Tinggi bayangan card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Card dengan sudut melengkung
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor, // Warna avatar sesuai tema
                  child: Text(
                    message["name"]![0], // Mengambil huruf pertama dari nama
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  message["name"]!,
                  style: TextStyle(fontWeight: FontWeight.bold), // Nama dalam teks tebal
                ),
                subtitle: Text(message["message"]!),
                trailing: Icon(Icons.arrow_forward_ios, size: 16), // Ikon kecil
                onTap: () {
                  // Tampilkan snackbar atau navigasi ke halaman detail
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Tapped on ${message['name']}")),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}