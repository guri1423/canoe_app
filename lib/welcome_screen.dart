import 'package:canoe_app/signin.dart';
import 'package:canoe_app/sinup.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200),()=>animationController.forward());
    Future.delayed(Duration(milliseconds: 2000),()=>showscreen(context));
    return Scaffold(
        backgroundColor:Colors.white,
        body:Stack(
          alignment: Alignment.center,
          children: [
            CircularRevealAnimation(
              animation: animation,
              minRadius: 50,
              child:Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color:Color(0xffd72027),

              ) ,
            ),
            Container(
              height:212 ,
              width: 212,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/redlogo.png")
                  )
              ),
            )
          ],
        )

    );
  }


  Widget _imageContainer(BuildContext context){
    return Container(
      width: 306,
      height: 202,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/boat.png")
          )
      ),
    );
  }


  void showscreen(BuildContext context){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 1700),
        barrierColor: Colors.transparent,
        barrierLabel: MaterialLocalizations.of(context).dialogLabel,
        transitionBuilder: (context,animation,secondaryanimation,child){
          return SlideTransition(position: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutCubic
          ).drive(Tween<Offset>(begin: Offset(0,-1.0),
              end: Offset.zero)
          ),
            child: child,
          );
        },
        pageBuilder:(context,_,__){
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover
                ),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 100,),
                    child: _imageContainer(context),
                  ),
                  Spacer(),
                  Text(
                    "Pick up & Drop Off ",
                    style: TextStyle(
                      color: Color(0xff2d2d2d),
                      fontSize: 32,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 20),
                  //   child: Text(
                  //     "Lorem Ipsum is simply dummy text\nof the printing and typesetting  text\nindustry.  since the 1500s,",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Color(0xff2d2d2d),
                  //       fontSize: 18,
                  //       fontFamily: "Lato",
                  //       fontWeight: FontWeight.w300,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 80,),
                  buttons(context),
                  SizedBox(height: 100,),


                ],
              ),


            ),
          );
        }
    );
  }

  Widget buttons(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
          },
          child: Container(
            width: 180,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(41),
              color: Color(0xffd72027),
            ),
            child: Center(
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
          },
          child: Container(
            width: 180,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(41),
              color: Color(0xffd72027),
            ),
            child: Center(
              child: Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}