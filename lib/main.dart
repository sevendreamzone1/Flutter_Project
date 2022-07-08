import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  double page = 0.0;

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
    );

    _pageController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    setState(() {
      page = _pageController.page!;
       
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      



      
      
      body: Column(
       
        children: [
         
          Container(
       
       decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_1.jpg"),
            fit: BoxFit.fill,
          ),
        ),
            child: AspectRatio(
              aspectRatio: 0.6,
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) {

                  return ColoredBox(
                    
                    color: colors[index],
                    offset: (index - page).clamp(-1, 1).toDouble(),
                  );
                },
                itemCount: colors.length,
              ),
            ),
          ),
       
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(_onScroll);
    _pageController.dispose();
    super.dispose();
  }
}

class ColoredBox extends StatelessWidget {
  final Color color;
  final double offset;

  const ColoredBox({
    Key? key,
    required this.color,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      margin: EdgeInsets.all(24),
      child: Center(
        child: Text(
          offset.toStringAsFixed(2),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
