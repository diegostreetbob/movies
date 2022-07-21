import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../services/movies_services.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class MovieSearchDelegate extends SearchDelegate{
  //Sobreescribo para que apareza esto en lugar de search
  @override
  String get searchFieldLabel => "Buscar...";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: ()=> query = ""//borramos el texto Buscar...
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);//volvemos a la anterior pantalla sin retornar nada
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("buildResults");
  }
  //se dispara cada vez que el query cambie
  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return _emptyContainer();
    }
    final moviesProvider = Provider.of<MoviesService>(context, listen: false);
    return FutureBuilder(
        future: moviesProvider.searchMovies(query),
        builder: (_, AsyncSnapshot<List<Movie>> snapshot){
          //si no encuentra nada
          if(!snapshot.hasData) return _emptyContainer();
          final movies = snapshot.data!;
          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (_,int index)=> _MovieItem(movies[index])
          );
        }
      );

  }
  //método utilitario
  Widget _emptyContainer(){
    return Container(
      child: const Center(
        child: Icon(Icons.movie_creation_outlined,color: Colors.black38,size: 150),
      ),
    );
  }

}
class _MovieItem  extends StatelessWidget {
  final Movie movie;
  const _MovieItem (this.movie);

  @override
  Widget build(BuildContext context) {
        return ListTile(
            leading: FadeInImage(
                placeholder: const AssetImage("assets/images/no-image.jpg"),
                image: NetworkImage(movie.posterImgUrl),
                height: 150,
                fit: BoxFit.contain
            ),
          title: Text(movie.title),
          subtitle: Text(movie.originalTitle),
          onTap: (){
              Navigator.pushNamed(context, "details",arguments: movie);
          },
          );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////