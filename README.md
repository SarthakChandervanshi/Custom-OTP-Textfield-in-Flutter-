<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A custom OTP style entering textfield with custom UI and supports device of any dimension.

## Features

* A custom OTP entering textfield which support devices of any dimension
* It supports custom UI
* You can alter the length of OTP

## Getting started

You must provide the allowable width of textfield and the text editing controller 

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
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
```

## Additional information

There is a minor fault in the textfield which is , it does not detect empty back spaces. It will be corrected in the upcoming versions.

https://drive.google.com/file/d/1gEGLSinwr2a5FzGn6Z8l1zdu9ci1Ros5/view
