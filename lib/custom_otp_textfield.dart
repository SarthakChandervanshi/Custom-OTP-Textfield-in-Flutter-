library custom_otp_textfield;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOTPTextField extends StatefulWidget {
  const CustomOTPTextField({
    Key? key,
    this.cursorColor = Colors.black,
    this.textStyle = const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
    this.inputBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8))
    ),
    this.boxSize = 60,
    this.otpLength = 4,
    this.spaceBetweenTextFields = 20,
    required this.deviceWidth,
    required this.textEditingController,
    this.cursorHeight = 40
  }) :  assert(deviceWidth >= (otpLength * boxSize) + ((otpLength - 1) * spaceBetweenTextFields),"OTP length of $otpLength is not supported on your current device's width"),
        assert(cursorHeight != 0,"Cursor heightcannot be zero"),
        super(key: key);

  final Color cursorColor;
  final TextStyle textStyle;
  final InputBorder inputBorder;
  final double boxSize;
  final int otpLength;
  final double spaceBetweenTextFields;
  final double deviceWidth;
  final TextEditingController textEditingController;
  final double cursorHeight;

  @override
  State<CustomOTPTextField> createState() => _CustomOTPTextFieldState();
}

class _CustomOTPTextFieldState extends State<CustomOTPTextField> {

  late List<FocusNode> focusNodes;
  late List<TextEditingController> textEditingControllers;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(widget.otpLength, (index) => FocusNode());
  }

  @override
  void dispose() {
    focusNodes.map((e) => e.dispose());
    focusNodes.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.boxSize,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return SizedBox(
            width: widget.boxSize,
            child: TextField(
                onChanged: (val){
                  setState((){

                    /// Adding text to controller until it overflows
                    if(widget.textEditingController.text.length < widget.otpLength){
                      widget.textEditingController.text += val;
                    }

                    /// To clear textfield when it reaches first textfield
                    if(index == 0 && val.isEmpty){
                      widget.textEditingController.clear();
                    }

                    /// To change focus of textfields forward and backward
                    if(val.isEmpty && index >= 1){
                      widget.textEditingController.text = widget.textEditingController.text.substring(0,widget.textEditingController.text.length - 1);
                      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                    }
                    else if(val.length == 1 && index < widget.otpLength - 1){
                      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                    }
                  });
                },
                cursorHeight: widget.cursorHeight,
                focusNode: focusNodes[index],
                scrollPhysics: const NeverScrollableScrollPhysics(),
                textAlign: TextAlign.center,
                expands: false,
                maxLength: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                cursorColor: widget.cursorColor,
                style: widget.textStyle,
                decoration: InputDecoration(
                  counterText: "",
                  border: widget.inputBorder,
                  errorBorder: widget.inputBorder,
                  enabledBorder: widget.inputBorder,
                  focusedBorder: widget.inputBorder,
                  disabledBorder: widget.inputBorder,
                )
            ),
          );
        },
        separatorBuilder: (context,index){
          return SizedBox(width: widget.spaceBetweenTextFields);
        },
        itemCount: widget.otpLength,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

