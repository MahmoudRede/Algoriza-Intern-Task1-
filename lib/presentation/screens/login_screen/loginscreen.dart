import 'package:algoriza_intern_task1/presentation/screens/register_screen/registerscreen.dart';
import 'package:algoriza_intern_task1/presentation/widgets/button_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/defaultformfield.dart';
import 'package:algoriza_intern_task1/presentation/widgets/googlebutton_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/headtext_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/navigate_to.dart';
import 'package:algoriza_intern_task1/presentation/widgets/text_manager.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {

   LoginScreen({Key? key}) : super(key: key);
    var phoneController=TextEditingController();
     GlobalKey<FormState> formKey =GlobalKey<FormState>();

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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [

                    Image(
                        image:  const AssetImage('assets/images/back.jpg',),
                        fit: BoxFit.cover,
                        height:MediaQuery.of(context).size.height*.25,
                        width: double.infinity,
                    ),
                    Positioned(
                      left: 15,
                      top: 30,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 25,
                              color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                       TextManager(
                           text: 'Welcome to Fashion Daily',
                           color: Colors.grey[700]!,
                           fontSize: 15
                       ),
                       const SizedBox(height: 12,),
                       Row(
                         children: const [
                           HeadTextManager(
                             text: 'Sign in',
                             color: Colors.black,
                             fontSize: 42,
                             fontWeight:FontWeight.w500 ,
                           ),
                           Spacer(),
                           TextManager(text: 'Help', color: Colors.blue, fontSize: 18),
                           SizedBox(width: 10,),
                            Icon(
                               Icons.help,
                               color: Colors.blue,
                               size: 27,
                           ),

                       ],
                     ),
                     const SizedBox(height: 15,),
                     TextManager(
                       text: 'Phone Number',
                       color: Colors.grey[600]!,
                       fontSize: 17,
                       fontWeight: FontWeight.w500,
                     ),
                     const SizedBox(height: 10,),
                     DefaultFormField(
                       hint: ' Eg. 812345678',
                       validText: 'Phone number is not registered ',
                       controller: phoneController,
                       textInputType: TextInputType.phone,
                       prefixWidget: CountryPickerDropdown(
                         initialValue: 'EG',
                         itemBuilder: _buildDropdownItem,
                         priorityList:[
                           CountryPickerUtils.getCountryByIsoCode('EG'),
                           CountryPickerUtils.getCountryByIsoCode('CN'),
                         ],
                         sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                         onValuePicked: (Country country) {
                           print(country.name);
                         },
                       ),

                     ),
                     const SizedBox(height: 15,),
                     ButtonManager(
                         text: 'Sign in',
                         textColor: Colors.white,
                         textFontSize: 17,
                         buttonColor: Colors.blueAccent,
                         buttonRadius: 7,
                         function: (){
                            if(formKey.currentState!.validate()){
                               print('Validate Done');
                            }
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
                         InkWell(
                             onTap: (){
                               navigateTo(RegisterScreen(), context);
                             },
                             child: const TextManager(
                               text: 'Register here',
                               color: Colors.blue,
                               fontSize: 16,
                               fontWeight: FontWeight.w500,)
                         ),
                       ],
                     ),
                     const  SizedBox(height: 25,),
                     TextManager(
                         text: 'Use the application according to policy rules. Any kinds of violations will be subject to sanctions',
                         color: Colors.grey[700]!,
                         fontSize: 14
                     ),
                   ],
                 ),
               )
            ],
            ),
          ),

      ));
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
