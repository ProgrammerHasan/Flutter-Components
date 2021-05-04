import 'package:flutter/material.dart';
import 'package:flutter_components/components/ms_fIcon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MsFIconButtonExample extends StatefulWidget {
  @override
  _MsFIconButtonExampleState createState() => _MsFIconButtonExampleState();
}

class _MsFIconButtonExampleState extends State<MsFIconButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:  ListTile(
          trailing: Icon(Icons.info,color: Colors.white,),
          title: Text('Ms FIcon Button',
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
            textAlign: TextAlign.left,
          ),
        ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 4.0,
                        child: InkWell(
                          onLongPress: () async {

                          },
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 8,),
                              SizedBox(
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: ExactAssetImage('assets/img/programmerhasan.png'),
                                ),
                                width: 70,
                                height: 70,
                              ),
                              Text(
                                'Programmer Hasan',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Sr. Software Developer & Programmer \nFounder & CEO at Ms IT Xpress',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 4.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MsFIconButton(
                                    size: GFSize.SMALL,
                                    onPressed: (){

                                    },
                                    icon: FaIcon(FontAwesomeIcons.globe),alignment: Alignment.center,
                                    type: GFButtonType.outline,
                                    shape: GFIconButtonShape.pills,
                                    color: Colors.teal,
                                  ),
                                  SizedBox(width: 4.0,),
                                  MsFIconButton(
                                    size: GFSize.SMALL,
                                    onPressed: (){

                                    },
                                    icon: FaIcon(FontAwesomeIcons.globe),alignment: Alignment.center,
                                    type: GFButtonType.outline,
                                    shape: GFIconButtonShape.pills,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 4.0,),
                                  MsFIconButton(
                                    size: GFSize.SMALL,
                                    onPressed: (){
                                      //https://facebook.com/ProgrammerHasan.s
                                    },
                                    icon: FaIcon(FontAwesomeIcons.facebook),alignment: Alignment.center,
                                    type: GFButtonType.outline,
                                    shape: GFIconButtonShape.pills,
                                  ),
                                  SizedBox(width: 4.0,),
                                  MsFIconButton(
                                    size: GFSize.SMALL,
                                    onPressed: (){
                                      // https://www.youtube.com/channel/UC_yR5D8mamiA4yWs_WHK0Kw
                                    },
                                    icon: FaIcon(FontAwesomeIcons.youtube),
                                    type: GFButtonType.outline,
                                    shape: GFIconButtonShape.pills,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 4.0,),
                                  MsFIconButton(
                                    size: GFSize.SMALL,
                                    onPressed: (){
                                      //https://github.com/programmerhasan
                                    },
                                    icon: FaIcon(FontAwesomeIcons.github),
                                    type: GFButtonType.outline,
                                    shape: GFIconButtonShape.pills,
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  MsFIconButton(
                                    size: GFSize.SMALL,
                                    onPressed: (){
                                      // https://twitter.com/mehedihasan_04
                                    },
                                    icon: FaIcon(FontAwesomeIcons.twitter),
                                    type: GFButtonType.outline,
                                    shape: GFIconButtonShape.pills,
                                    color: Colors.cyan,
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.0,
                              ),
                              Divider(
                                color: Colors.teal[200],
                                thickness: 1,
                                indent: 50.0,
                                endIndent: 50.0,
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ],
              ),
            ),
          ),
        )
    );
  }

}
