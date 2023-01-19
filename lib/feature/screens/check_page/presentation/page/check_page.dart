import 'package:check_store/feature/screens/check_page/view_model/check_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webview_flutter/webview_flutter.dart';

final checkNotifier = ChangeNotifierProvider((ref) => CheckVM());

class CheckPage extends ConsumerStatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends ConsumerState<CheckPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    ref.read(checkNotifier).url = ModalRoute.of(context)?.settings.arguments as String?;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Your Check"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(checkNotifier).screenshotController.capture().then((value)async{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 20.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    content: const Text('Captured your screen!'),
                  ),
                );
              });
            },
            icon: const Icon(Icons.screenshot),
          ),
        ],
      ),
      body: Screenshot(
        controller: ref.read(checkNotifier).screenshotController,
        child: WebView(
          initialUrl: ref.read(checkNotifier).url,
        ),
      ),
    );
  }
}
