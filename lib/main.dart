import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: tfSaat,
              onTap: ()
              {

                showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                .then((alinanSaat)
                {
                  setState(() {
                    tfSaat.text="Saat: ${alinanSaat?.hour}: ${alinanSaat?.minute} ";
                  });

                }); }),



            TextField(
                controller: tfTarih,
                onTap: () {
                  showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050)
                  ).then((alinanTarih)
                  {
                    setState(() {
                      tfTarih.text = "${alinanTarih?.day}/${alinanTarih?.month}/${alinanTarih?.year}";
                    });
                  }
                  )
                  ;}),
                  /*
                   showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                      .then((alinanSaat)
                  {
                    setState(() {
                      tfSaat.text="Saat: ${alinanSaat?.hour}: ${alinanSaat?.minute} ";
                    });

                  }); }),
                   */



          ],
        ),
      ),

    );
  }
}
