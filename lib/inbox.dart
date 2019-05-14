import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  InboxPage({Key key}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  double bottomHeight = 170.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //disable shadow
        leading: Icon(Icons.menu),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(bottomHeight),
            child: makeAppbarBottom(context)),
      ),
      body: makeBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget makeAppbarBottom(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 16, 18, 16), //padding
      height: bottomHeight,
      width: MediaQuery.of(context).size.width,
      //Retrieve screen width
      child: Column(
        children: <Widget>[
          Text(
            "Inbox",
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: Colors.white),
            // Get text style from app theme
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Row(
              children: <Widget>[
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade700, blurRadius: 24)
                      ],
                      shape: BoxShape.circle),
                ),
                Expanded(
                  flex: 1, // Fill all remaining space
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Esther Stone",
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .copyWith(color: Colors.white),
                        ),
                        Container(
                          height: 4,
                        ),
                        Text(
                          "3 new messages",
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(color: Colors.white54),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white54,
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      iconEnabledColor: Colors.white,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.white),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "Primary",
                          ),
                        )
                      ],
                      onChanged: (v) {},
                    ),
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  List<Map> emails = [
    {
      "name": "Lucile Gibbs",
      "title": "Champion league",
      "body": "Lorem ipsum",
      "datetime": "10:04 AM",
    },
    {
      "name": "Harry Cummings",
      "title": "Champion league",
      "body": "Lorem ipsum",
      "datetime": "9:04 AM",
    },
    {
      "name": "Lucile Gibbs",
      "title": "Champion league",
      "body": "Lorem ipsum",
      "datetime": "10:04 AM",
    },
    {
      "name": "Lucile Gibbs",
      "title": "Champion league",
      "body": "Lorem ipsum",
      "datetime": "10:04 AM",
    },
    {
      "name": "Lucile Gibbs",
      "title": "Champion league",
      "body": "Lorem ipsum",
      "datetime": "10:04 AM",
    },
  ];
  Widget makeBody(BuildContext context) {
    return LayoutBuilder(
        //To receive available width & height,
        //or to access scaffold view/method
        builder: (BuildContext context, BoxConstraints constraints) {
      return Stack(
        children: <Widget>[
          Container(
            height: 60,
            color: Theme.of(context).primaryColor,
            //retrieve primary color
          ),
          ListView.builder(
            itemCount: emails.length,
            itemBuilder: makeListItem,
          )
        ],
      );
    });
  }

  Widget makeListItem(BuildContext context, int i) {
    Map email = emails[i];
    return Container(
      padding: EdgeInsets.fromLTRB(24, 0, 16, 8),
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Row(
            children: <Widget>[
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                child: Text(
                  email["name"].toString().substring(0,1),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.green.shade200, shape: BoxShape.circle),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(
                              email["name"],
                              style:
                                  Theme.of(context).textTheme.subhead.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                            ),
                          ),
                          Text(
                            email["datetime"],
                            style: Theme.of(context).textTheme.subhead.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        height: 2,
                      ),
                      Text(
                        email["title"],
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 18,
                            ),
                      ),
                      Container(
                        height: 8,
                      ),
                      Text(
                        email["body"],
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              color: Colors.grey.shade500,
                            ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
