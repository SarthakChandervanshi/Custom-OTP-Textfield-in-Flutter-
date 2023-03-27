import 'package:custom_otp_textfield/custom_otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom OTP Textfield Demo",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomOTPTextField(
              deviceWidth: MediaQuery.of(context).size.width,
              textEditingController: textEditingController,
              boxSize: 70,
              inputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.lightBlueAccent,width: 5),
              ),
              cursorColor: Colors.blue,
              otpLength: 5,
              textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              spaceBetweenTextFields: 10,
              cursorHeight: 40,
            ),
            SizedBox(height: 60,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16)
              ),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Text is: ${textEditingController.text}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),))),
                child: const Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}