import 'package:algoriza_intern_task1/presentation/widgets/button_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/googlebutton_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/text_manager.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Color(0Xff2A3C54)
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
                image:  AssetImage('assets/images/back.jpg',),
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
            ),
             Container(
               padding: const EdgeInsets.symmetric(
                 vertical: 15,
                 horizontal: 20
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const SizedBox(height: 10,),
                   TextManager(text: 'Welcome to Fashion Daily', color: Colors.grey[700]!, fontSize: 15),
                   const SizedBox(height: 12,),
                   Row(
                     children: [
                       Text('Sign in',style: GoogleFonts.lora(
                           color: Colors.black,
                           fontSize: 42,
                           fontWeight: FontWeight.w500
                       ),),
                       const Spacer(),
                       const TextManager(text: 'Help', color: Colors.blue, fontSize: 18),
                       const SizedBox(width: 10,),
                        const Icon(
                           Icons.help,
                           color: Colors.blue,
                           size: 27,
                       ),

                     ],
                   ),
                   const SizedBox(height: 15,),
                   TextManager(text: 'Phone Number', color: Colors.grey[600]!, fontSize: 17,fontWeight: FontWeight.w500,),
                   const SizedBox(height: 10,),
                   TextFormField(
                     decoration:  InputDecoration(
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(5),
                       ),
                       hintText: 'Eg. 812345678',
                       hintStyle: GoogleFonts.aBeeZee(
                         color: Colors.grey[400],
                       ) ,
                       prefixIcon:CountryPickerDropdown(
                         initialValue: 'EG',
                         itemBuilder: _buildDropdownItem,
                         priorityList:[
                           CountryPickerUtils.getCountryByIsoCode('EG'),
                           CountryPickerUtils.getCountryByIsoCode('CN'),
                         ],
                         sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                         onValuePicked: (Country country) {
                           print("${country.name}");
                         },
                       )

                     ),
                   ),
                   const SizedBox(height: 15,),

                   ButtonManager(
                       text: 'Sign in',
                       textColor: Colors.white,
                       textFontSize: 17,
                       buttonColor: Colors.blue,
                       buttonRadius: 7,
                       function: (){

                       }
                   ),
                   const SizedBox(height: 15,),
                   Align(
                       alignment: Alignment.center,
                       child: TextManager(text: 'Or', color: Colors.grey[700]!, fontSize: 16,)
                   ),
                   const SizedBox(height: 15,),
                   const GoogleButtonManager(),
                   const SizedBox(height: 25,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       TextManager(text: 'Doesn\'t has any account?', color: Colors.grey[700]!, fontSize: 16,fontWeight: FontWeight.w500,),
                       const SizedBox(width: 5,),
                       const TextManager(text: 'Register here', color: Colors.blue, fontSize: 16,fontWeight: FontWeight.w500,),
                     ],
                   ),
                   const  SizedBox(height: 25,),
                   TextManager(text: 'Use the application according to policy rules. Any kinds of violations will be subject to sanctions', color: Colors.grey[700]!, fontSize: 14),


                 ],
               ),
             )
          ],
        ),
      ),

    );
  }
}

Widget _buildDropdownItem(Country country) => Row(
  children: <Widget>[
    const SizedBox(
      width: 8.0,
    ),
    Text("+${country.phoneCode}"),
  ],
);
