import 'package:cryptodesign/API/remote/response/Status.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:cryptodesign/demo/PostApi/ViewModel/PostApiVM.dart';
import 'package:flutter/material.dart';

class PostApi extends StatefulWidget {
  const PostApi({Key? key}) : super(key: key);

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  PostApiVM viewModel = PostApiVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post API'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                hintText: 'Enter name',
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                hintText: 'Enter Phone no',
                controller: phoneController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                hintText: 'Enter email',
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                hintText: 'Vehicle',
                controller: vehicleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                hintText: 'job title',
                controller: jobController,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            RoundedBoxButton(
                onTap: () {
                  viewModel.fetchPostApi({
                    "FirstName": nameController.text,
                    "PhoneNumber": phoneController.text,
                    "Email": emailController.text,
                    "Vehicle": vehicleController.text,
                    "JobTitle": jobController.text
                  });
                  viewModel.addListener(() {
                    if (viewModel.postapi.status == Status.COMPLETED) {
                      print("post: ${viewModel.postapi.data?.id}");
                    }
                  });
                },
                text: 'Submit')
          ],
        ),
      ),
    );
  }
}
