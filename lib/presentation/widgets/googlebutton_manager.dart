import 'package:algoriza_intern_task1/presentation/widgets/text_manager.dart';
import 'package:flutter/material.dart';

class GoogleButtonManager extends StatelessWidget {


  const GoogleButtonManager(
      {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.blue,width: 1),
          ),
          padding:  const EdgeInsets.symmetric(
              vertical: 15
          ),
          color: Colors.white,
          onPressed:(){

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                  image: AssetImage('assets/images/search.png'),
                  height: 20,
                  width:20 ,
              ),
              SizedBox(width: 10,),
              TextManager(text:'Sign with by google' ,color:Colors.blue ,fontSize:15,fontWeight: FontWeight.w500,)
            ],
          )
      ),
    );
  }
}
