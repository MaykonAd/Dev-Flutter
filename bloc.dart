import "dart:async";
class AppBloc{
  int _contador;
  AppBloc(){
    _controllerContador.stream.asBroadcastStream();
  }
  //Stream

  StreamController<int> _controllerContador = StreamController<int>();
  StreamSink <int> get _sink => _controllerContador.sink;
  Stream<int> get stream => _controllerContador.stream;

  void incrementaContador(){
    _contador++;
    _sink.add(_contador);
  }

  void dispose(){
    _controllerContador.close();
}

}