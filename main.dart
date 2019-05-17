import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloc.dart';

main() => runApp(AppExemplo());

class AppExemplo extends StatefulWidget {
  @override
  _AppExemploState createState() => _AppExemploState();
}

class _AppExemploState extends State<AppExemplo> {
  var dado = 0;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Provider<AppBloc>(
      builder: (_) => AppBloc(),
      dispose: (_, value) => value.dispose(),
      child: MaterialApp(
        home: Scaffold(
          drawer: Drawer(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.plus_one),
            onPressed: () {
              setState(() {
                Provider.of<AppBloc>(context).incrementaContador();              });
            },
          ),
          appBar: AppBar(
            title: Text("App Exemplo"),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: Center(
            child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Olá mundo",
                      style: TextStyle(color: Colors.red, fontSize: 30),
                      textDirection: TextDirection.ltr,
                    ),
                    StreamBuilder<int>(
                        stream: Provider
                            .of<AppBloc>(context)
                            .stream,
                        builder: (context, snapshot) {

                        }
                    )
                  ],
                )),
          ),
        ),
      ),
    );

    return
  }
}
