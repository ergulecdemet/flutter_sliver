import 'package:flutter/material.dart';
import 'package:sliver_delegate/sliver_header_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

bool _isAppBarVisible = false;
double appBarHeight = 50;

class _HomeState extends State<Home> {
  final String text =
      'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            floating: false,
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              leadingShow: false,
              statusBarHeight: MediaQuery.of(context).padding.top,
              expandedHeight: 400,
              background: MutableBackground(
                expandedWidget: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://avatars.mds.yandex.net/i?id=03d80bf0ff1cf81b5764b368cd04f7a5b48b0564-9066439-images-thumbs&n=13'))),
                  child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            print("pressed");
                          },
                          child: const Text("press"))),
                ),
                collapsedColor: const Color(0xBE7A81FF),
              ),
              collapsedHeight: appBarHeight, // 80

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.amber,
                      width: MediaQuery.of(context).size.width,
                      child: IconButton(
                          onPressed: () {
                            print("pressed");
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                    )
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lorem,',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    text * 15,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
