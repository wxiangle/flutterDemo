import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/animation/animation.dart';
import 'package:flutter_widgets/dialog/dialog.dart';
import 'package:flutter_widgets/gesture/gesture_page.dart';
import 'package:flutter_widgets/mygrid.dart';
import 'package:flutter_widgets/mylist.dart';
import 'package:flutter_widgets/sp/my_sp_demo.dart';
import 'package:flutter_widgets/utils/images.dart';

import 'animation/async_anim.dart';
import 'animation/animation_builder.dart';
import 'animation/animation_route.dart';
import 'animation/animation_widget.dart';
import 'animation/stagger.dart';
import 'gesture/gesture_page2.dart';
import 'gesture/tapgesture_page.dart';

final secondPageRoute = "/second_route";
final secondRoute4 = "/second_route4";
final firstPageRoute = "/";

final myCurpertinoApp = CupertinoApp(
  localizationsDelegates: const <LocalizationsDelegate>[
    DefaultMaterialLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
    DefaultWidgetsLocalizations.delegate,
  ],
  home: CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Cupertino App'),
    ),
    child: myCurpertinoPage(),
  ),
);

class myCurpertinoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        child: Text('Show Alert'),
        onPressed: () {
          MyDialogs.showMaterialAlertDialog(context);
        },
      ),
    );
  }
}

final myMaterialApp = MaterialApp(
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
              context,
              defaultScaffold(BuilderAnim(), title: 'builder 构建动画'),
              '打开Builder Animation'),
          buildDefaultButton(context,
              defaultScaffold(AsyncAnim(), title: '同步动画'), '打开Async Animation'),
          buildInkWellAvatar(context),
          buildDefaultButton(
              context, defaultScaffold(StaggerF(), title: '交织动画'), '打开交织动画'),
          buildDefaultButton(context, GesturePage(), '手势'),
          buildDefaultButton(context, TapGesturePage(), '手势2'),
          buildDefaultButton(context, GesturePage3(), '手势3'),
          buildDefaultButton(context, SpTestPage(), '持久化')
        ],
      ),
    ));
  }

  /// Hero动画
  InkWell buildInkWellAvatar(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return defaultScaffold(RouteAnim(), title: '路由动画');
        }));
      },
      child: Hero(
          tag: 'avatar',
          child: ClipOval(
            child: Image.network(
              MyImages.image_ke_lala,
              fit: BoxFit.fitHeight,
              width: 50,
              height: 50,
            ),
          )),
    );
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
                transitionDuration: const Duration(milliseconds: 500),
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
        ///不带动画
        // Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        // Navigator.push(context,  CupertinoPageRoute(builder: (context) => page));
        ///带有动画
        Navigator.push(context, PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: page,
          );
        }));
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
