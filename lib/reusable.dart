
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget progress() =>  Center(
        child: CircularProgressIndicator(
      color: defaultColor2,
    ));
Widget item({
  model,
  context,
  Function? function,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 3),
      child: InkWell(
        onTap: () {
          function!();
        },
        child:
            Card(
              color: Colors.white,
              elevation: 5,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SizedBox(
                      width: 110,
                      height: 110,
                      child: Image.network('${model.image}'),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Text(
                    '${model.name}',
                    style:  TextStyle(
                      color: defaultColor2,
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
        ),
    );

Widget itemClick({
  model,
  context,
  Function ? function,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ()
        {
          function!();
        },
        child: Card(
          elevation: 5,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    '${model.image}',
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${model.name}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget newColumn({
  name,
  value,
  video,
}) => Column(
      children: [
         Text(
          '$name',
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        value!='YouTube'?Text(
          '$value',
          style: const TextStyle(
            color: Colors.black,
          ),
        )
            :
        InkWell(
          onTap: ()
          {
            final Uri url = Uri.parse('$video');
            launchUrl(url);
          },
          child: Text(
            '$value',
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );

void goTo({context, screen}) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );

Widget searchItem(model,context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Card(
    elevation: 5,

    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                '${model.image}',
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${model.name}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                newColumn(
                  name: 'origin',
                  value: model.origin,
                ),
                newColumn(
                  name: 'category',
                  value: model.category,
                ),
                newColumn(
                  name: 'video',
                  value: 'YouTube',
                  video: model.video,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'instruction : ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${model.instruction}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
Color defaultColor1=const Color(0xFFed9e67);
Color defaultColor2=const Color(0xFF281e32);