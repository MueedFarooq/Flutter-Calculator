import 'package:flutter/material.dart';
import 'package:calculator/components/constants_buttons.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(const Calculator());
}
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userinput ='';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      Align(alignment: Alignment.bottomRight,
                          child: Text(userinput.toString(),style: TextStyle(fontSize: 30,color: Colors.white),)),
                        SizedBox(height: 5,),
                        Text(result.toString(),style: TextStyle(fontSize: 30,color: Colors.white),)

                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                    Row(
                      children: [
                        Mybutton(title: 'AC',onpress: (){
                          userinput='';
                          result = '';
                          setState(() {});
                        },color: Color(0xffA5A5A5),),
                        Mybutton(title: '+/-',onpress: (){
                          userinput+='+/-';
                          setState(() {});
                        },color: Color(0xffA5A5A5),),
                        Mybutton(title: '%',onpress: (){
                          userinput+='%';
                          setState(() {});
                        },color: Color(0xffA5A5A5),),
                        Mybutton(title: '/',color: Color(0xffffa00a),onpress: (){
                          userinput+='/';
                          setState(() {});
                        },),

                      ],
                    ),
                      Row(
                        children: [
                          Mybutton(title: '7',onpress: (){
                            userinput+='7';
                            setState(() {});
                          },),
                          Mybutton(title: '8',onpress: (){
                            userinput+='8';
                            setState(() {});
                          },),
                          Mybutton(title: '9',onpress: (){
                            userinput+='9';
                            setState(() {});
                          },),
                          Mybutton(title: 'x',color: Color(0xffffa00a),onpress: (){
                            userinput+='x';
                            setState(() {});
                          },),

                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(title: '4',onpress: (){
                            userinput+='4';
                            setState(() {});
                          },),
                          Mybutton(title: '5',onpress: (){
                            userinput+='5';
                            setState(() {});
                          },),
                          Mybutton(title: '6',onpress: (){
                            userinput+='6';
                            setState(() {});
                          },),
                          Mybutton(title: '-',color: Color(0xffFF9F0A),onpress: (){
                            userinput+='-';
                            setState(() {});
                          },),

                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(title: '1',onpress: (){
                            userinput+='1';
                            setState(() {});
                          },),
                          Mybutton(title: '2',onpress: (){
                            userinput+='2';
                            setState(() {});
                          },),
                          Mybutton(title: '3',onpress: (){
                            userinput+='3';
                            setState(() {});
                          },),
                          Mybutton(title: '+',color: Color(0xffffa00a),onpress: (){
                            userinput+='+';
                            setState(() {});
                          },),

                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(title: '0',onpress: (){
                            userinput+='0';
                            setState(() {});
                          },),
                          Mybutton(title: '.',onpress: (){
                            userinput+='.';
                            setState(() {});
                          },),
                          Mybutton(title: 'DEL',onpress: (){
                            (userinput.length == 0 )?userinput = "" :
                            userinput=userinput.substring(0,userinput.length-1);
                            setState(() {
                            });
                          },),
                          Mybutton(title: '=',color: Color(0xffffa00a),onpress: (){
                            setState(() {
                              solve_result();
                            });
                          },),

                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void solve_result(){
    try {
      String final_exp;
      final_exp = userinput.replaceAll('x', '*');
      ExpressionParser p = GrammarParser();
      Expression exp = p.parse(final_exp);
      ContextModel contextModel = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, contextModel);
      result = eval.toString();
    }catch ( FormatException){
      result ='Error';
    }
  }
}

