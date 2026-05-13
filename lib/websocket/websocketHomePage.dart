import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Websockethomepage extends StatefulWidget {
  final WebSocketChannel channel;
  const Websockethomepage({super.key , required this.channel});

  @override
  State<Websockethomepage> createState() => _WebsockethomepageState();
}

class _WebsockethomepageState extends State<Websockethomepage> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Socket'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
                child: TextFormField(
                  controller: editingController,
                  decoration: InputDecoration(
                    labelText: "Send any message",
                  ),
                )
            ),
            StreamBuilder(
                stream: widget.channel!.stream,
                builder: (context, snapshot){
                  return Padding(
                      padding: EdgeInsets.all(20),
                    child: Text(snapshot.hasData?'${snapshot.data}' : ''),
                  );
                }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            _sendMyMessage;
          },
              child: Icon(Icons.send),
      ),
    );


  }
  void _sendMyMessage(){
    if(editingController.text.isNotEmpty){
      widget.channel.sink.add(editingController.text);
    }
  }
  @override
  void dispose() {
    super.dispose();
    widget.channel.sink.close();
  }
}
