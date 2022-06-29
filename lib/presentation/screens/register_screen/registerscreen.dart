import 'package:algoriza_intern_task1/presentation/screens/login_screen/loginscreen.dart';
import 'package:algoriza_intern_task1/presentation/widgets/button_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/defaultformfield.dart';
import 'package:algoriza_intern_task1/presentation/widgets/googlebutton_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/headtext_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/navigate_to.dart';
import 'package:algoriza_intern_task1/presentation/widgets/text_manager.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   var emailController=TextEditingController();

   var phoneController=TextEditingController();

   var passController=TextEditingController();

   bool isPassword=false;

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
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const Image(
                      image:  AssetImage('assets/images/back.jpg',),
                      fit: BoxFit.cover,
                      height: 80,
                      width: double.infinity,
                    ),
                    Positioned(
                      left: 15,
                      top: 15,
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
                      const SizedBox(height: 5,),
                      TextManager(text: 'Welcome to Fashion Daily', color: Colors.grey[700]!, fontSize: 15),
                      const SizedBox(height: 8,),
                      Row(
                        children: const [
                          HeadTextManager(text: 'Register', color: Colors.black, fontSize: 42),
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
                      TextManager(text: 'Email', color: Colors.grey[600]!, fontSize: 17,fontWeight: FontWeight.w500,),
                      const SizedBox(height: 10,),
                      DefaultFormField(
                          validText:'Please enter your email' ,
                          controller: emailController,
                          isPassword: false,
                          hint: 'Eg. example@email.com',
                          textInputType: TextInputType.emailAddress,
                      ),


                      const SizedBox(height: 15,),
                      TextManager(text: 'Phone Number', color: Colors.grey[600]!, fontSize: 17,fontWeight: FontWeight.w500,),
                      const SizedBox(height: 10,),
                      DefaultFormField(
                          validText: 'Please enter your phone',
                          hint: ' Eg. 812345678',
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
                      TextManager(text: 'Password', color: Colors.grey[600]!, fontSize: 17,fontWeight: FontWeight.w500,),
                      const SizedBox(height: 10,),


                      DefaultFormField(
                        validText: 'Please enter your password',
                        controller: passController,
                        textInputType: TextInputType.visiblePassword,
                        isPassword: isPassword,
                        hint: 'password',
                        suffixFunction: (){
                          setState(() {
                            isPassword=!isPassword;
                            print(isPassword);
                          });
                        },
                        suffixIcon: isPassword==false?Icons.visibility:Icons.visibility_off,
                      ),
                      const SizedBox(height: 10,),
                      ButtonManager(
                          text: 'Sign in',
                          textColor: Colors.white,
                          textFontSize: 17,
                          buttonColor: Colors.blue,
                          buttonRadius: 7,
                          function: (){
                            if(formKey.currentState!.validate()){
                              print('Validate Done');
                            }
                          }
                      ),
                      const SizedBox(height: 10,),
                      Align(
                          alignment: Alignment.center,
                          child: TextManager(text: 'Or', color: Colors.grey[700]!, fontSize: 16,)
                      ),
                      const SizedBox(height: 10,),
                      const GoogleButtonManager(),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextManager(text: 'Has any account?', color: Colors.grey[700]!, fontSize: 16,fontWeight: FontWeight.w500,),
                          const SizedBox(width: 5,),
                          InkWell(
                              onTap: (){
                                navigateTo(LoginScreen(), context);
                              },
                              child: const TextManager(
                                text: 'Sign in here',
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,)
                          ),
                        ],
                      ),
                      const  SizedBox(height: 20,),
                      TextManager(text: 'By regestering your account,you are agree to our', color: Colors.grey[500]!, fontSize: 14),
                      const SizedBox(height: 10,),
                      const Align(
                        alignment: Alignment.center,
                          child: TextManager(text: 'terms and condition', color: Colors.blue, fontSize: 14)),



                    ],
                  ),
                )
              ],
            ),
          ),
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
