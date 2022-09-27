import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/data_controller.dart';

class UserDetailListScreen extends StatefulWidget {
  const UserDetailListScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailListScreen> createState() => _UserDetailListScreenState();
}

class _UserDetailListScreenState extends State<UserDetailListScreen> {
  DataController dataController = Get.put(DataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataController.getUserInformationFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => dataController.isDataLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 1,
              itemBuilder: (ctx, i) {
                String image = '';
                String title = '';
                String subTitle = '';

                try {
                  image = dataController.user_list!.data![i].picture!;
                } catch (e) {
                  image = '';
                }
                try {
                  // ignore: prefer_interpolation_to_compose_strings
                  title = dataController.user_list!.data![i].firstName! +
                      " " +
                      dataController.user_list!.data![i].lastName!;
                } catch (e) {
                  title = '';
                }
                try {
                  subTitle = dataController.user_list!.data![i].id!;
                } catch (e) {
                  subTitle = '';
                }
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(image),
                  ),
                  title: Text(title),
                  subtitle: Text(subTitle),
                );
              },
            ),
    ));
  }
}
