import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}
class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.15),
          IconButton(onPressed: (){
            Navigator.pop(context);
          },
            icon: const Icon(Icons.arrow_back,color: Color(0xffFF683A)),),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search menu,restaurant or etc... ",
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black12
                    ),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Color(0xffFF683A), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
