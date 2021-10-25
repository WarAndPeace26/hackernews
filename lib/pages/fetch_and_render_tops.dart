import 'package:flutter/material.dart';
import 'package:hackernews/API/api_manager.dart';
import 'package:hackernews/models/article_model.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';


class TopNewsPage extends StatefulWidget {
  const TopNewsPage({Key? key}) : super(key: key);

  @override
  _TopNewsPageState createState() => _TopNewsPageState();
}

class _TopNewsPageState extends State<TopNewsPage> {
  ApiManager apiManager = ApiManager();

  List<Article> articles = [];
  List<int> ids = [8863];
  Future? _initialLoad;

  @override
  void initState() {
    getList();
    _initialLoad = loadMore();
    super.initState();
  }

  bool _hasMore(){
    print("checking");
    return articles.length <= ids.length;
  }

  Future getList()  async{
    await apiManager.fetchIdsOfTopArticlesId().then(
            (value){
              ids = value;
              print(ids);
            }
    );
  }



  Future loadMore() async {
    for(var i = 0; i < 10; i++){
      await apiManager.fetchArticleById(ids[articles.length]).then((value) {
        setState(() {
          articles.add(value);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _initialLoad,
        builder: (context, snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return IncrementallyLoadingListView(
                hasMore: _hasMore,
                loadMore: loadMore,
                itemBuilder: (context, index){
                  return Container(
                    child: ListTile(
                      title: Text(
                        articles[index].title!
                      ),
                    ),
                  );
                },
                itemCount: ()=>articles.length,
                loadMoreOffsetFromBottom: 0,
                separatorBuilder: (_,__)=> const Divider(),
              );
            default:
              return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
