import 'package:flutter/material.dart';
import 'package:flutter_widgets/Async_anim.dart';
import 'package:flutter_widgets/animation.dart';
import 'package:flutter_widgets/animation_builder.dart';
import 'package:flutter_widgets/animation_widget.dart';
import 'package:flutter_widgets/dialog.dart';
import 'package:flutter_widgets/mygrid.dart';
import 'package:flutter_widgets/mylist.dart';

final secondPageRoute = "/second_route";
final secondRoute4 = "/second_route4";
final firstPageRoute = "/";

final routeApp = MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  ),
  initialRoute: firstPageRoute,
  routes: {
    firstPageRoute: (context) => const FirstRoute(),
    secondPageRoute: (context) => SecondRoute3(),
  },
  onGenerateRoute: (settings) {
    /// 拦截未在路由表里注册的路由
    if (settings.name == secondRoute4) {
      final arg = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => SecondRoute4(arg.toString()),
          settings: settings);
    }
    return null;
  },
);

Widget defaultScaffold(Widget child, {String? title}) => Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Page'),
      ),
      body: child,
    );

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(Center(
      child: Column(
        children: [
          buildRouteButton(context),
          buildDialogButton(context),
          buildDefaultButton(context, MyListPage(), '打开List列表'),
          buildDefaultButton(context, MyGridPage(), '打开GridList列表'),
          buildDefaultButton(
              context, defaultScaffold(BasicAnim()), '打开Animation'),
          buildDefaultButton(
              context, defaultScaffold(WidgetAnim()), '打开Widget Animation'),
          buildDefaultButton(
              context, defaultScaffold(BuilderAnim()), '打开Builder Animation'),
          buildDefaultButton(
              context, defaultScaffold(AsyncAnim()), '打开Async Animation')
        ],
      ),
    ));
  }

  ElevatedButton buildRouteButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // var result = await Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => const SecondRoute2(
        //             'this is an arg from first page')));
        // print('arg = $result');

        // var result = await Navigator.pushNamed(context, secondRoute4,
        //     arguments:
        //         'this is an arg from first page , about pushNamed method');
        // print('arg = $result');

        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 800),
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: const SecondRoute5('from page 1'),
                  );
                }));
      },
      child: const Text('打开路由'),
    );
  }

  ElevatedButton buildDialogButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return MyDialogs.getDefaultDialog(context);
          },
        );
      },
      child: const Text('打开弹窗'),
    );
  }

  ElevatedButton buildDefaultButton(
      BuildContext context, Widget page, String buttonText) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(buttonText),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('second page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('关闭页面'),
        ),
      ),
    );
  }
}

class SecondRoute2 extends StatelessWidget {
  final String arg;

  const SecondRoute2(this.arg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('second page 2'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(arg),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'result from second route 2');
              },
              child: const Text('关闭页面'),
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments ?? "";
    return Scaffold(
      appBar: AppBar(
        title: const Text('second page 3'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(arg.toString()),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'result from second route 3');
              },
              child: const Text('关闭页面'),
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute4 extends StatelessWidget {
  final String arg;

  const SecondRoute4(this.arg, {super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments ?? "";
    return Scaffold(
      appBar: AppBar(
        title: const Text('second page 4'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(arg.toString()),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'result from second route 4');
              },
              child: const Text('关闭页面'),
            )
          ],
        ),
      ),
    );
  }
}

/// page route 动画
class SecondRoute5 extends StatelessWidget {
  final String arg;

  const SecondRoute5(this.arg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('second page 5'),
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(arg.toString()),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'result from second route 5');
                },
                child: const Text('关闭页面'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
