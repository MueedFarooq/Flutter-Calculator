void main() {
  print("Start");

  fetchData(); // Asynchronous call
for( int i=0;i<10;i++){
  print("End");
}
}

Future<void> fetchData() async {
  await Future.delayed(Duration(seconds: 5));
  print("Data loaded!");
}
