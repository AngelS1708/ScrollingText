import 'package:flutter/material.dart';
import 'package:prototipado/widgets/horizontal_scrolling_text.dart';
import 'package:prototipado/utils/colors.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScrollingText',
      //Cambia el estilo de la pantalla a Dark
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  //Variable para el formulario
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Variable para guardar el texto del formulario
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String textForm = '    El isai nomas anda de molestoso   ';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('SCROLL',
            style: TextStyle(
              fontFamily: 'PressStart2P',
              fontSize: 40,
            ),
          ),
          const Text('TEXT',
            style: TextStyle(
              fontFamily: 'PressStart2P',
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          //Form donde se introduce el texto
          Form(
            key: _formKey,
            child: TextFormField(

              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Enter a text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                focusColor: mikadoYellowColor,
              ),
              validator: (String? value) { //Verifica que el form tenga un dato almenos
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),

          SizedBox(height: 40,),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: blueColor,

            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {  //Valida que exista texto en el form
                _formKey.currentState!.save();
                textForm = '  ' + _textController.text + '  ';  //Guarda el texto en una variable
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HorizontalScrolling(
                      text: textForm,
                      textStyle: const TextStyle(
                        fontSize: 200.0,
                        color: Colors.purpleAccent,
                        fontFamily: 'VT323',
                      ),
                      velocity: 150.0,
                    ),
                  ),
                );
              }
            },
            child: const Text('Show',
              style: TextStyle(
              color: Colors.white,
            ),
            ),
          ),
        ],
      ),
    );
  }
}