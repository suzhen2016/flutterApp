
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// 详情页
class EditPage extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("知鱼行"),
				centerTitle: true,
				leading: IconButton(
					icon:Icon(Icons.arrow_back_ios),
					onPressed:() => Navigator.pop(context, false),
				),
			),
			body: Scrollbar(
				child: SingleChildScrollView(
					padding: EdgeInsets.all(12.0),
					child: Center(
						child: Column(
							// 显式指定对齐方式为左对齐，排除对齐干扰
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								// 标题
								Padding(
									padding: EdgeInsets.all(12.0),
									child: Container(
										width: double.infinity,
										child: Center(
											child: Text('中国梦',style: TextStyle(color: Colors.purple,fontSize: 25.0,fontWeight: FontWeight.w500 )),
										)
									)
								),
								// 段落
								RichText(
									textAlign: TextAlign.left,
									text: TextSpan(
										text: '小中',
										children: <TextSpan>[
											TextSpan(text:'中国梦，是中国共产党第十八次全国代表大会召开以来，习近平总书记所提出的重要指导思想和重要执政理念，正式提出于2012年11月29日。习总书记把“中国梦”定义为“实现中华民族伟大复兴，就是中华民族近代以来最伟大梦想”，并且表示这个梦“一定能实现”。“中国梦”的核心目标也可以概括为“两个一百年”的目标，也就是：到2021年中国共产党成立100周年和2049年中华人民共和国成立100周年时，逐步并最终顺利实现中华民族的伟大复兴，具体表现是国家富强、民族振兴、人民幸福，实现途径是走中国特色的社会主义道路、坚持中国特色社会主义理论体系、弘扬民族精神、凝聚中国力量，实施手段是政治、经济、文化、社会、生态文明五位一体建设',
												style: TextStyle(fontSize: 16.0,color: Colors.red)),
										],
									),
								),
								// 图片
								Padding(
									// 上下左右各添加8像素补白
									padding: EdgeInsets.all(8.0),
									child: Card(
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadiusDirectional.circular(15)),
											clipBehavior: Clip.antiAlias,
											child: Image.asset(
												"assets/img/zhong1.png",
												// width: double.maxFinite,
												fit: BoxFit.cover
											),
									),
								),

								RichText(
									textAlign: TextAlign.left,
									text: TextSpan(
										text: '国梦',
										children: <TextSpan>[
											TextSpan(text: "2017年10月22日，习近平同志在十九大报告中指出，实现中华民族伟大复兴是近代以来中华民族最伟大的梦想。中国共产党一经成立，就把实现共产主义作为党的最高理想和最终目标，义无反顾肩负起实现中华民族伟大复兴的历史使命，团结带领人民进行了艰苦卓绝的斗争，谱写了气吞山河的壮丽史诗。习近平指出，实现伟大梦想，必须进行伟大斗争；必须建设伟大工程；必须推进伟大事业。", 
												style: TextStyle(color: Color(0xff0000ff),fontSize: 18.0),
												recognizer: TapGestureRecognizer()
												..onTap = () {
													print("跳转到协议...");
													// Fluttertoast.showToast(
													// 	msg: "网络连接错误",
													// 	toastLength: Toast.LENGTH_SHORT, 
													// 	gravity: ToastGravity.CENTER, 
													// 	timeInSecForIos: 1, 
													// 	fontSize : 14.0,
													// 	backgroundColor: Colors.red,
													// 	textColor: Colors.white
													// );
												},
											),
										]
									)
								),
								// 图片
								Padding(
									// 上下左右各添加8像素补白
									padding: EdgeInsets.all(8.0),
									child: Card(
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadiusDirectional.circular(15)),
											clipBehavior: Clip.antiAlias,
											child: Image.asset(
												"assets/img/zhong2.png",
												// width: double.maxFinite,
												fit: BoxFit.cover
											),
									),
								),
								
								RichText(
									textAlign: TextAlign.left,
									text: TextSpan(
										text: '国梦',
										children: <TextSpan>[
											TextSpan(text: '二是树立实干精神，发挥先锋模范作用。空谈误国，实干兴邦。广大党员干部要带头贯彻落实中央八项规定，以求真务实的作风开展工作，坚持讲真话，讲实话，讲有用的话，不讲空话、套话、假话；要脚踏实地，多接地气，以扎实的工作作风、真切的有效成绩来团结干部、凝聚党心，不断筑牢党群干群关系，深化鱼水深情。同时，要充分发挥党员先锋模范作用，用自己的工作热情来影响带动更多的人，形成上下一心，团结奋进的局面，充分践行“走在前、干在前、争首善、当先锋”的先锋示范精神，争做先锋表率。',
												style: TextStyle(fontSize: 18.0,color: Colors.black)
											)
										]
									)
								),
							
								Padding(
									// 上下左右各添加8像素补白
									padding: EdgeInsets.all(8.0),
									child: Card(
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadiusDirectional.circular(15)),
											clipBehavior: Clip.antiAlias,
											child: Image.asset(
												"assets/img/zhong3.png",
												// width: double.maxFinite,
												fit: BoxFit.cover
											),
									),
								),

								RichText(
									textAlign: TextAlign.left,
									text: TextSpan(
										text: '国梦',
										children: <TextSpan>[
											TextSpan(text: '一是增强学习意识，提高素质能力。学习影响着一个国家的发展走向，决定着一个政党的荣辱兴衰。毛泽东同志曾说：“饭可以一日不吃，觉可以一日不睡，书不可以一日不读。”邓小平同志也曾说过“学习是前进的基础”。面对科技进步日新月异、知识更新不断加快、国际形势不断变化，新情况新问题层出不穷，在这样的情况下，只有不断加强学习才能跟上时代的步伐，才能在这个时代立足。广大党员干部应自觉把学习作为一种生活态度、一种工作责任、一种精神追求，加强对理论知识、文化知识、专业知识的学习，树立终身学习的理念；要积极向书本学习、向实践学习、向群众学习，不断提高综合素质，增强创新能力。',
												style: TextStyle(fontSize: 18.0,color: Colors.black)
											),
										]
									)
								),
								
								RichText(
									textAlign: TextAlign.left,
									text: TextSpan(
										text: "登陆即视为同意",
										style: TextStyle(color: Color(0xAA333333),fontSize: 18),
										children: [
											TextSpan(
												text: "《巴乐兔服务协议》", 
												style: TextStyle(color: Color(0xAACE1928))
											),
										]
									),
									textDirection: TextDirection.rtl,
								)
							],
							
						),
					)
				)
			),
		);
	}
}