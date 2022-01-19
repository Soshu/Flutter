  import 'package:flutter/material.dart';
  import 'package:device_info/main.dart';

   class ROAControls {
     _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
      currentFocus.unfocus();

      if(nextFocus != null)
        FocusScope.of(context).requestFocus(nextFocus);
  }
     Widget ROATextField(BuildContext context, TextEditingController _controller, FocusNode currentFocusNode,TextInputType keyBoardType, bool isSecureEntry, String placeholder,TextInputAction action,IconData ico, FocusNode nextFocusNode ){
      return TextFormField(
              controller: _controller,
              keyboardType: keyBoardType,
              textInputAction: action,
              focusNode: currentFocusNode,
              onFieldSubmitted: (term){
                _fieldFocusChange(context, currentFocusNode, nextFocusNode);
              },
               obscureText: isSecureEntry,
               decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(color: roaStyleBase.placeholder),
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(4),
                  borderSide: new BorderSide(color: roaStyleBase.lightBlueGreyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(color: roaStyleBase.lightBlueGreyColor),
                ),
                prefixIcon: Container(
                              width: 60,
                              height:60,
                              decoration: BoxDecoration(border: Border(right: BorderSide(color: roaStyleBase.lightBlueGreyColor))),
                              margin: EdgeInsets.only(right: 10),
                              //padding: Egne,
                              child:Icon(ico,color:roaStyleBase.roaPrimaryColor)

                              ,
                //hintText: AppLocalizations.of(context).getText("phone"),
              ),

              ),
            );
    }



    Widget ROATextarea(TextEditingController _controller,TextInputAction action, int maxLines){
      return TextFormField(
                              maxLines: maxLines,
                              controller: _controller,
                              textInputAction: action,
                              decoration: InputDecoration(
                                enabledBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(4),
                                  borderSide: new BorderSide(color: roaStyleBase.lightBlueGreyColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(color: roaStyleBase.lightBlueGreyColor),
                                ),
                              ),

                            );
    }
    Widget ROARaisedBtn(String title,  VoidCallback onPressed) {
      return RaisedButton(
              highlightColor: roaStyleBase.lightBlueGreyColor,
              disabledColor: roaStyleBase.lightBlueGreyColor,
              focusColor: roaStyleBase.lightBlueGreyColor,
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: roaStyleBase.roaPrimaryColor)
              ),
              color: roaStyleBase.roaPrimaryColor,
              padding: EdgeInsets.only(top: 15, bottom: 15,left: 16,right: 16),
              textColor: Colors.white,
              child: Text(title,style: roaStyleBase.buttontext,),
              onPressed: onPressed,
            );
    }
    Widget LoginWithFBBtn(BuildContext context, VoidCallback onPressed){
      return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Color(0xFF507CC0))
        ),
        padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
        color: const Color(0xFF507CC0),
        onPressed: onPressed,
        child: new Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Image.asset(
              'assets/fb.png',
              height: 48.0,
              width: 48.0,

            ),
            new Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width-90,
              padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: new Text("Login with Facebook",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
            ),
          ],
        )
      );
    }
    Widget LoginWithGoogleBtn(BuildContext context,VoidCallback onPressed){
      return RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Color(0xFFDF4930))
              ),
              padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
              color: const Color(0xFFDF4930),
              onPressed: onPressed,
              child: new Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Image.asset(
                    'assets/google.png',
                    height: 48.0,
                    width: 48.0,

                  ),
                  new Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width-90,
                    padding: EdgeInsets.only(left: 10.0,right: 10.0),
                      child: new Text("Login with Google+",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                  ),
                ],
              )
            );
    }
  }