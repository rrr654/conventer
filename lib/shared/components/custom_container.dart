import 'package:flutter/material.dart';
Widget customCont({
  required Color color,
  required VoidCallback onPressed,
     String text1= "Euro",
     String text2 = "1 E",
}){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    width: 400,
    height: 100,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
         Text(
          text1,
          style:const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_drop_down,
            size:38 ,
          ),
        ),
        const Spacer(),
         Text(
          text2,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  );
  }