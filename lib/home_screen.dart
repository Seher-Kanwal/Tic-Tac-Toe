import 'package:flutter/material.dart';
import 'package:tic_tac_teo_new/textstyle.dart';


class MyhomePage extends StatefulWidget {
  const MyhomePage({Key? key}) : super(key: key);

  @override
  _MyhomePageState createState() => _MyhomePageState();
}
class _MyhomePageState extends State<MyhomePage> {
  bool oturn=true; //turn of O
  //list for dealing the box of game
  List <String >display=['','','','','','','','',''];
  // score for players
  int scoreO=0;
  int scoreX=0;
  int filledbox=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" TIC TAC TOE",style: nexttextstyle,),
        backgroundColor: Colors.white12,
        elevation: 20,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            width: 250,
            height: 50,
          ),
          Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Player X\n',style:nexttextstyle ,),
                        Text(scoreX.toString(),style:nexttextstyle ,),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text('Player O\n',style: nexttextstyle,),
                        Text(scoreO.toString(),style:nexttextstyle ,),
                      ],
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9, //9 boxes
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), //each will have 3 boxes
                //for physically building the grid we give properties to item build
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Tapped(index);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Colors.white10,
                            style: BorderStyle.solid),
                          bottom: BorderSide(
                              width: 1,
                              color: Colors.white10,
                              style: BorderStyle.solid), //BorderSide
                          left: BorderSide(
                              width: 1,
                              color: Colors.white10,
                              style: BorderStyle.solid), //Borderside
                          right: BorderSide(
                              width: 1,
                              color: Colors.white10,
                              style: BorderStyle.solid),
                      ),
                      ),
                      child: Center(
                        child: Text(display[index],
                          style:const  TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Center(child: Text("@created by SEHER",style: nexttextstyle,))),
        ],
      ),

    );
  }
  void Tapped(int index){
    filledbox=filledbox+1;
    setState(() {
      if(oturn && display[index]==''){
        display[index]='O';
      }
      else if ( display[index]=='')
      {
        display[index]='X';
      }});
    //as we want to change turn so we changing the turn by making it false
    oturn =!oturn;
    checkwinner();
  }
  void checkwinner(){
    if((display[0] == display[1] && display[0] == display[2]) && display[0]!='')
    {
      showdialog(display[0]);
    }
    if((display[3] == display[4] && display[3] == display[5]) && display[3]!='')
    {
      showdialog(display[3]);
    }
    if((display[6] == display[7] && display[7] == display[8]) && display[6]!='')
    {
      showdialog(display[6]);
    }
    if((display[0] == display[3] && display[0] == display[6]) && display[0]!='')
    {
      showdialog(display[0]);
    }
    if((display[1] == display[4] && display[4] == display[7]) && display[1]!='')
    {
      showdialog(display[1]);
    }
    if((display[2] == display[5] && display[2] == display[8]) && display[2]!='')
    {
      showdialog(display[2]);
    }
    if((display[2] == display[4] && display[2] == display[6]) && display[2]!='')
    {
      showdialog(display[2]);
    }
    if((display[0] == display[8] && display[0] == display[4]) && display[0]!='')
    {
      showdialog(display[0]);
    }
    else if(filledbox==9)
    {
      showdrawdialog();
    }

  }
  showdrawdialog(){
    showDialog(
        barrierDismissible: false,
        // barrier F allow us to continue only if we click on next game
        context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("DRAW GAME ",style: mytextstyle,),
        actions: [
          TextButton(

            onPressed: () { setState(() {
              clearboard();
              Navigator.of(context).pop();
              //this will remove the alert dialog screen
            }); },
            child:  Text("Play Again...",style: mytextstyle,),
          ),
        ],
        elevation: 6,
      );
    });

  }
  showdialog( String winner)
  {
    showDialog(
        barrierDismissible: false,
        context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Winner iS " + winner, style: mytextstyle,),
        actions: [
          TextButton(

            onPressed: () { setState(() {
              clearboard();
              Navigator.of(context).pop();
              //this will remove the alert dialog screen
            }); },
            child: Text("Play Again...",style: mytextstyle,),
          ),
        ],
        elevation: 6,
      );
    });
    if(winner=='O')
    {
      scoreO=scoreO+1;
    }
    else if(winner=='X')
    {
      scoreX=scoreX+1;
    }
  }
  void clearboard()
  {
    setState(() {
      for(int i=0;i<9;i++)
      {
        display[i]='';
      }
    });
    filledbox=0;
  }
}