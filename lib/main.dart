import 'package:flutter/material.dart';

void main() {
  runApp(const EFF());
}

class EFF extends StatefulWidget {
  const EFF({super.key});

  @override
  State<EFF> createState() => _EFFState();
}

class _EFFState extends State<EFF> {
    String nbh="";
    String Niveau="";
    var Somme=0;
    bool convention=false;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Paiement centre ",style: TextStyle(fontSize: 30),),
                 ),
        body: Container(
          width: double.infinity,
          height: double.infinity,

          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                /////////////////////Premiere ligne///////////////////////////////////////////////////////////
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Expanded(flex: 3,
                      child: Container(child: Text("Nombre d'heure par semaine",style: TextStyle(fontSize: 20),))),
                  Expanded(flex: 1,
                    child: Container(
                      child: TextField(
                        onChanged: (value) {
                          nbh=value;
                          
                        },
                 
                      ),
                    ),
                  )
                  ],
                ),
              ),

               /////////////////////Fin du Premiere ligne///////////////////////////////////////////////////////////
               ////////////////////Deuxieme ligne ///////////////////////////////////////////////////////////////////
              Container(
                
                child:Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(child: Text("Niveau :",style: TextStyle(fontSize: 20)),),
                      SizedBox(width: 20,),
                      Container(child: Text("Initiation :",style: TextStyle(fontSize: 20)),),
                      Container(
                        child:    
                        Radio(value: "initiation", groupValue: Niveau, onChanged: (val){
                             setState(() {
                                 Niveau=val!;
                                    print(Niveau);
                  });
                }),
                      ),
                      Container(child: Text("Avancé :",style: TextStyle(fontSize: 20)),),
                          Container(
                        child:    
                        Radio(value: "avancé", groupValue: Niveau, onChanged: (val){
                             setState(() {
                                 Niveau=val!;
                                    print(Niveau);
                  });
                }),
                      )
                    ],
                  ),
                ) ,
                ),
                /////////////////////////////////Fin Deuxieme ligne///////////////////////
                /////////////////////////////////Trosieme ligne /////////////////////////
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        child: Text("Conventionné :",style: TextStyle(fontSize: 20),),
                      ),
                      Container(
                        child:Checkbox(value: convention, onChanged: (val){
                          setState(() {
                              convention = val!;
                                        });
                                   print(convention);
                }),
                      )
                    ],
                  ),
                ),
                ////////////////////////////Fin troisieme ligne ////////////
                SizedBox(height: 60,),
                ////////////////////////////quatriemeligne ////////////
                Container(
                  width: 100,
                  height: 30,
                       decoration: BoxDecoration(
                color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
                  child: 
             MaterialButton(
              
            
              
              
              onPressed: (){
              
              setState(() {
                if (nbh!=""){
                var nbhi=int.parse(nbh);
                if (Niveau=="initiation"){
                  Somme=nbhi*4*30;
                }
                else if (Niveau=="avancé"){
                  Somme=nbhi*4*50;
                }
                else {print("erreur");}
                if(convention==true && Somme>100){
                    Somme=Somme -100;
                }
              }
              });
              

             },
             
             color: Colors.grey,
             child: Text("Calculer",style: TextStyle(fontSize: 15,color: Colors.white),),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             )

                ),
                ////////////////////////////fin quatriemeligne ////////////
                SizedBox(height: 30,),
                ////////////////////////////cinquieme ligne ////////////
              Container(
                child: Text("$Somme DH"),
              )
                
            ],
          ),
        ),
      ),
      
    );
  }
}