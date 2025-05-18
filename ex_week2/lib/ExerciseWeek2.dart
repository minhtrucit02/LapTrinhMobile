import 'package:flutter/material.dart';

class ExerciseWeek2 extends StatelessWidget {
  const ExerciseWeek2({super.key});

  bool isNumber(String s){
    if(s.isEmpty) return false;
    return int.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final ageController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "THỰC HÀNH 01",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(child: Text("Họ và tên: ")),

                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "Vui lòng nhập họ và tên";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Expanded(child: Text("Tuổi: ")),

                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: ageController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "Vui lòng nhập tuổi!!";
                                    }

                                    if(!isNumber(value)){
                                      return "Vui lòng nhập số tuổi hợp lệ.";
                                    }

                                    final age = int.tryParse(value);
                                    if(age == null || age < 0 ){
                                      return "Giá trị không hợp lệ";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            final name = nameController.text;
                            final age = int.tryParse(ageController.text);
                            String message;

                            if(age! < 2 ){
                              message = "Em bé";
                            }
                            else if(age < 6){
                              message = "Trẻ em";
                            }
                            else if(age < 65){
                              message = "Người lớn";
                            }
                            else {
                              message = "Người già";
                            }
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Tác giả"),
                                content: Text("$name: $message"),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Đóng"))
                                ],
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue
                        ),
                        child: Text("Kiểm tra",style: TextStyle(color: Colors.white),)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
