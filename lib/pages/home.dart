import 'package:flutter/material.dart';
import '../service/yts_data_call.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
                    backgroundColor: Colors.black,
                    title: Text("MADEON"),
                    centerTitle: true,
                    elevation: 0.0,
        ),
        body : ListView(
            scrollDirection : Axis.vertical,
            children: <Widget>[
              MovieList("Action"),
              MovieList("Romance"),
              MovieList("Comedy"),
              MovieList("Thriller"),
              MovieList("Sci-Fi"),
              MovieList("Crime"),
              MovieList("Horror"),

            ],
        ),
          backgroundColor: Colors.grey[200]
      ),
    );
  }
}


class MovieList extends StatefulWidget {

  String genre;
  String url;

  MovieList(this.genre);

  @override
  _MovieListState createState() => _MovieListState(this.genre);
}

class _MovieListState extends State<MovieList> {

  String genre;
  API api;
  List movieList;

  _MovieListState(String genre){
    this.genre = genre;
    this.api = new API(genre);
    this.movieList = new List();
  }

  getData() async{
    movieList =  await this.api.getMovies();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
          child: Text(
            this.genre,
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontFamily: "Teko-Medium",
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
            height: 120,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child : ListView.builder(
                itemCount: movieList.length,
                scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image : DecorationImage(
                      image: NetworkImage("https://yts.ae${movieList[index]['medium_cover_image']}")
                    )
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: 100,
                );
              }
            )
        ),
      ],
    );
  }
}



