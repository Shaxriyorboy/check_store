import 'package:check_store/common/router/route_name.dart';
import 'package:check_store/feature/screens/home_page/view_model/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final homeNotifier = ChangeNotifierProvider((ref) => HomeVM());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Your checks",),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, AppRouteName.QR_CODE_SCANNER_PAGE);
          }, icon: const Icon(Icons.camera_alt)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 1.sh,
        width: 1.sw,
        child: ListView.builder(itemBuilder: (context,index){
          return Card(
            elevation: 4,
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: const Text("Evos"),
              subtitle: const Text("11.12.2021"),
            ),
          );
        }),
      ),
    );
  }
}
