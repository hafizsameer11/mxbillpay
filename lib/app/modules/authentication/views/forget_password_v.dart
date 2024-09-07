
import '../../../export.dart';

class ForgetPasswordView extends StatelessWidget {
  final ForgetPasswordController controller = Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: _customizedAppBar(),
    body: Scaffold(
      body: GetBuilder<ForgetPasswordController>(
        init: ForgetPasswordController(),
        builder: (controller){
          return _body();
        },
      ),
    ),
  );
  }
  _customizedAppBar(){
    return CustomAppBar(
      leadingWidth: width_50,
      titleInCentre: false,
      titleWidget: TextView(text: forgetPassword,textStyle: textStyleHeading(),),
    );
  }

  _body(){
   return Column(
     children: [
       TextFieldWidget(
         contentPadding:EdgeInsets.symmetric(vertical: margin_18,horizontal:margin_10 ),
         hint: emailAddress,
         textViewText: emailAddress,
         radius: radius_10,
         inputType: TextInputType.text,
         hintStyle: textStyleLabel2().copyWith(
           fontFamily: FontFamily.barnaulGrotesk,
           color: Colors.grey.shade400,
           fontWeight: FontWeight.w500,
         ),
       ).paddingAll(margin_15),
       _forgetPasswordButton()
     ],
   );
  }





  _forgetPasswordButton(){
    return Container(
      width: Get.width,
      height: height_50,
      padding: const EdgeInsets.only(left: 15,top: 5,right: 15,bottom: 0),
      child: ElevatedButton(onPressed: (){

      }, child: TextView(
          text:forgetPassword,
      textStyle: TextStyle(
        fontFamily: FontFamily.barnaulGrotesk,
        fontWeight: FontWeight.w500
      ),),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius_10))
          )),
    );
  }
}
