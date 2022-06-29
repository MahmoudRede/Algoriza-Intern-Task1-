import 'package:algoriza_intern_task1/presentation/widgets/button_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/googlebutton_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/text_manager.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image:  AssetImage('assets/images/back.jpg',),
                fit: BoxFit.cover,
                height: 80,
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
                    const SizedBox(height: 5,),
                    TextManager(text: 'Welcome to Fashion Daily', color: Colors.grey[700]!, fontSize: 15),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text('Register',style: GoogleFonts.lora(
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
                    TextManager(text: 'Email', color: Colors.grey[600]!, fontSize: 17,fontWeight: FontWeight.w500,),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration:  InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: 'Eg. example@email.com',
                          hintStyle: GoogleFonts.aBeeZee(
                            color: Colors.grey[400],
                          ) ,

                      ),
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
                    TextManager(text: 'Password', color: Colors.grey[600]!, fontSize: 17,fontWeight: FontWeight.w500,),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'password',
                        hintStyle: GoogleFonts.aBeeZee(
                          color: Colors.grey[400],
                        ) ,

                      ),
                    ),
                    const SizedBox(height: 10,),
                    ButtonManager(
                        text: 'Sign in',
                        textColor: Colors.white,
                        textFontSize: 17,
                        buttonColor: Colors.blue,
                        buttonRadius: 7,
                        function: (){

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
                        const TextManager(text: 'Register here', color: Colors.blue, fontSize: 16,fontWeight: FontWeight.w500,),
                      ],
                    ),
                    const  SizedBox(height: 10,),
                    TextManager(text: 'By regestering your account? you are agree to our', color: Colors.grey[700]!, fontSize: 14),
                    const SizedBox(height: 10,),
                    TextManager(text: 'terms and condition', color: Colors.blue, fontSize: 14),



                  ],
                ),
              )
            ],
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
