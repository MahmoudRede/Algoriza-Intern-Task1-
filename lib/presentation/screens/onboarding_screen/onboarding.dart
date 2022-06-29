import 'package:algoriza_intern_task1/presentation/screens/login_screen/loginscreen.dart';
import 'package:algoriza_intern_task1/presentation/screens/register_screen/registerscreen.dart';
import 'package:algoriza_intern_task1/presentation/widgets/button_manager.dart';
import 'package:algoriza_intern_task1/presentation/widgets/navigate_to.dart';
import 'package:algoriza_intern_task1/presentation/widgets/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingModel{
  late final String title;
  late final String content;
  late final String image;

   onBoardingModel({
   required this.title,
   required this.content,
   required this.image,
   });

}

class OnBoarding extends StatelessWidget {

  var pageController=PageController();

  List onBoardingScreens=[
    onBoardingModel(
        title: 'Get food delivery to your doorstep asap',
        content: 'we have young and professional delivery team that will bring your food as soon as possible to your doorstep',
        image: 'assets/images/onBoarding1.png'
    ),
    onBoardingModel(
        title: 'Buy Any Food from favorite restaurant',
        content: 'We ate constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
        image: 'assets/images/onBoarding2.png'
    ),
    onBoardingModel(
        title: 'Receive your order at your doorstep in minutes',
        content: ' it is easy to determine the exact number of calories consumed at each meal',
        image: 'assets/images/onBoarding3.png'
    ),

  ];
    OnBoarding({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         elevation: 0.0,
         toolbarHeight: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10
        ),
         child: Column(
           children: [
             InkWell(
               onTap: (){
                 navigateTo(LoginScreen(), context);
               },
               child: Align(
                 alignment: Alignment.topRight,
                 child: Container(
                   padding: const EdgeInsets.symmetric(
                     vertical: 15,
                     horizontal: 25
                   ),
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                   decoration: BoxDecoration(
                     color: const Color(0Xffffede3),
                     borderRadius: BorderRadius.circular(20)
                   ),
                   child: const Text('Skip')
                 ),
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('7',style: GoogleFonts.openSans(
                   color: Colors.orange,
                   fontSize: 40,
                   fontWeight: FontWeight.bold
                 ),),
                 Text('Krave',style: GoogleFonts.aBeeZee(
                     color: Colors.teal,
                     fontSize: 40,
                     fontWeight: FontWeight.bold
                 ),)
               ],
             ),
             Expanded(
               child: PageView.builder(
                 physics: const BouncingScrollPhysics(),
                 controller: pageController,
                   itemBuilder: (context,index){
                     return Column(
                       children: [
                         Image(
                           image: AssetImage('${ onBoardingScreens[index].image}'),
                           height: MediaQuery.of(context).size.height*.37,
                           width: double.infinity,
                         ),
                         TextManager(
                           text:  onBoardingScreens[index].title,
                           color: Colors.black,
                           fontSize:27,
                           fontWeight: FontWeight.bold,
                         ),
                         const SizedBox(height: 13,),
                         TextManager(
                             text:  onBoardingScreens[index].content,
                             color: Colors.grey[700]!,
                             fontSize:17
                         ),

                       ],
                     );
                   },
                   itemCount:3 ,
               ),
             ),
             SmoothPageIndicator(
               controller: pageController,
               count: onBoardingScreens.length,
               effect: ExpandingDotsEffect(
                   dotColor: Colors.grey[300]!,
                   activeDotColor: Colors.orangeAccent,
                   radius: 4,
                   dotWidth: 18,
                   dotHeight: 6,
                   expansionFactor: 1.2
               ),

             ),
             const SizedBox(height: 22,),
             ButtonManager(
                 text: 'Get Started',
                 textColor: Colors.white,
                 textFontSize: 17,
                 buttonColor: Colors.teal,
                 buttonRadius: 10,
                 function: (){
                     navigateTo(LoginScreen(), context);
                 },
                 buttonPadding: 20,
                 textFontWeight: FontWeight.bold,

             ),
             const SizedBox(height: 15,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const TextManager(
                     text: 'Don\'t have an account?',
                     color: Colors.black,
                     fontSize: 18
                 ),
                 const SizedBox(width: 3,),
                 InkWell(
                   onTap: (){
                     navigateTo(RegisterScreen(), context);
                   },
                   child: const TextManager(
                       text: 'Sign Up',
                       color: Colors.teal,
                       fontSize: 18
                   ),
                 )
               ],
             ),
             const SizedBox(height: 10,),
           ],
         ),
      ),
    );
  }
}
