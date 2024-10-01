import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> _message = [];
  late IO.Socket socket;

  String _error = '';
  @override
  void initState() {
    connectToServer();
    super.initState();
  }

  void connectToServer(){
    socket=IO.io('http://192.168.0.107:3000',<String,dynamic>{
      'transports':['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.on('connect',(_){
      print('Connected to server');

    });




    // Listen for incoming chat messages
  socket.on('chat message', (data){
    _message.add(data);
  });




    // Listen for disconnection
    socket.on('disconnect', (_) {
      print('Disconnected from server');
    });




    // Listen for errors
    socket.on('connect_error', (data) {
      print('Connection Error: $data');
      setState(() {
        _error = 'Connection Error: $data';
      });
    });

    // Listen for connection timeout
    socket.on('connect_timeout', (data) {
      print('Connection Timeout: $data');
      setState(() {
        _error = 'Connection Timeout: $data';
      });
    });

  }


  void sendMessage(String message) {
    // Emit a message to the server
    socket.emit('chat message', message);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _message.length,
        itemBuilder: (context, index) {
          return Text(_message[index]);
        },),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          sendMessage("Testing");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
