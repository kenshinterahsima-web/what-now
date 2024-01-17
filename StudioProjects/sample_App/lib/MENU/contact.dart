import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // フォームが有効な場合の処理をここに追加
      String name = nameController.text;
      String email = emailController.text;
      String message = messageController.text;

      // ここでお問い合わせ情報を送信するロジックを実装します

      // 送信後のアクションを追加することもできます
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('お問い合わせ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'お名前'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'お名前を入力してください';
                  }
                  return null;
                },
              ),


              SizedBox(height: 50),




              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: '電話番号'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '電話番号を入力してください';
                  }
                  // メールアドレスのバリデーションを追加できます
                  return null;
                },
              ),
              TextFormField(
                controller: messageController,
                decoration: InputDecoration(labelText: 'お問い合わせ内容'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'メッセージを入力してください';
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),


              ElevatedButton(
                onPressed: _submitForm,
                child: Text('送信'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
