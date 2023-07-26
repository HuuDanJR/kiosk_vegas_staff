import 'package:flutter/material.dart';

Widget searchTextField(
    {scrollController,
    String? hint,
    Function? onTap,
    Function? onEditingComplete,
    Function? onSubmit,
    Function? onChange,
    bool hasInitValue = false,
    valueInit,
    controller}) {
  return TextFormField(
    autofocus: false, //Display the keyboard when TextField is displayed
    cursorColor: Colors.white,
    style: const TextStyle(color: Colors.white, fontSize: 18),
    scrollController: scrollController,
    keyboardType: TextInputType.number,
    textAlign: TextAlign.left,
    // onEditingComplete: () {
    //   onEditingComplete!();
    // },
    onFieldSubmitted: (value) => onSubmit!(value),
    // onTap: () => onTap!(),
    // onChanged: (value) => onChange!(value),
    controller: TextEditingController(text: valueInit),
    textInputAction:
        TextInputAction.search, //Specify the action button on the keyboard
    decoration: InputDecoration(
      //Style of TextField
      enabledBorder: const UnderlineInputBorder(
          //Default TextField border
          borderSide: BorderSide.none),
      focusedBorder: const UnderlineInputBorder(
          //Borders when a TextField is in focus
          borderSide: BorderSide.none),
      hintText: hint, //Text that is displayed when nothing is entered.
      hintStyle: const TextStyle(
          //Style of hintText
          color: Colors.white,
          fontSize: 18),
    ),
  );
}
