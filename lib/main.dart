import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  //Button Widget
  Widget calcbutton (String btntxt, Color btncolor,Color txtcolor){
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(padding:MaterialStatePropertyAll(EdgeInsets.all(12)),
        shape: MaterialStatePropertyAll(CircleBorder()),
          backgroundColor: MaterialStatePropertyAll(btncolor),
        ),
        onPressed: (){
          calculation(btntxt);
      },
          child: Text('$btntxt',
            style: TextStyle(
              fontSize: 35,
              color: txtcolor
            ),
          ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(margin: EdgeInsets.only(top: 25),child: Center(child: Text('Calculator',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),))),
          backgroundColor: Colors.black,
        ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('$text', style: TextStyle(fontSize: 100,color: Colors.white)
                      ,textAlign: TextAlign.left,),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('AC', Colors.grey, Colors.black),
                  calcbutton('+/-', Colors.grey, Colors.black),
                  calcbutton('%', Colors.grey, Colors.black),
                  calcbutton('/', Colors.amber.shade700, Colors.white)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('7', Colors.grey.shade800, Colors.white),
                  calcbutton('8', Colors.grey.shade800, Colors.white),
                  calcbutton('9', Colors.grey.shade800, Colors.white),
                  calcbutton('x', Colors.amber.shade700, Colors.white)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('4', Colors.grey.shade800, Colors.white),
                  calcbutton('5', Colors.grey.shade800, Colors.white),
                  calcbutton('6', Colors.grey.shade800, Colors.white),
                  calcbutton('-', Colors.amber.shade700, Colors.white)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('1', Colors.grey.shade800, Colors.white),
                  calcbutton('2', Colors.grey.shade800, Colors.white),
                  calcbutton('3', Colors.grey.shade800, Colors.white),
                  calcbutton('+', Colors.amber.shade700, Colors.white)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(StadiumBorder()),
                      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade800),
                      padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(34, 10, 92, 10))
                    ),
                      onPressed: (){
                      calculation('0');
                      },
                      child: Text('0',style:TextStyle(fontSize: 35,color: Colors.white),)),
                  calcbutton('.', Colors.grey.shade800, Colors.white),
                  calcbutton('=', Colors.amber.shade700, Colors.white)
                ],
              )
            ],
          ),
        ),
      )
    );
  }
  //Calculator Logic
  dynamic text = '0';
  dynamic numOne = 0;
  dynamic numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(btnText){
    if(btnText == 'AC'){
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '';
      opr = '';
      preOpr = '';
    }else if(opr == '=' && btnText == '='){
      if(preOpr == '+'){
        finalResult = add();
      }else if (preOpr == '-'){
        finalResult = sub();
      }else if (preOpr == 'x'){
        finalResult = mul();
      }else if (preOpr == '/'){
        finalResult = div();
      }
    }else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '='){
      if(numOne == 0){
        numOne = double.parse(result);
      }else{
        numTwo = double.parse(result);
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }else if(btnText == '%'){
      result = numOne/100;
      finalResult = doesContainDecimal(result);
    }else if(btnText == '.'){
      if(!result.toString().contains('.')){
        result = result.toString()+'.';
      }
      finalResult = result;
    }else if(btnText == '+/-'){
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;
    }else{
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }


  String doesContainDecimal(dynamic result){
    if(result.toString().contains('.')){
      List<String> splitDecimal = result.toString().split('.');
    }
    return result;
  }
  String add(){
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String sub(){
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul(){
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div(){
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
}
