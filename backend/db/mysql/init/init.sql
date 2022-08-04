-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET CHARSET UTF8MB4;
DROP SCHEMA IF EXISTS `recipinder`;
CREATE SCHEMA IF NOT EXISTS `recipinder` DEFAULT CHARACTER SET utf8mb4;
USE `recipinder`;

CREATE TABLE IF NOT EXISTS `users` (
    `id` VARCHAR(64) NOT NULL COMMENT 'ユーザID',
    `name` VARCHAR(64) NOT NULL COMMENT '名前',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '作成時',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新時',
    PRIMARY KEY (`id`),
    INDEX `idx_auth_token` (`id` ASC)
    );

CREATE TABLE IF NOT EXISTS `recipinder`.`recipis` (
    `id` MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'レシピID',
    `recipe_name` VARCHAR(64) NOT NULL COMMENT 'レシピネーム',
    `description` VARCHAR(512) NOT NULL COMMENT 'レシピ概要',
    `url` VARCHAR(128) NOT NULL COMMENT '料理画像URL',
    `place` integer NOT NULL COMMENT '値段',
    `ingredients` VARCHAR(512) NOT NULL COMMENT '材料ID',
    `tag` integer NOT NULL COMMENT 'tagid',
    `evaluation` integer NOT NULL COMMENT '評価',
    `kcal` integer NOT NULL COMMENT 'カロリー',
    `time` integer NOT NULL COMMENT '時間',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '作成時',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新時',
    PRIMARY KEY (`id`)
    );

CREATE TABLE IF NOT EXISTS `recipinder`.`recipe_process` (
    `id` MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `recipe_id` VARCHAR(64) NOT NULL COMMENT 'レシピID',
    `number` integer NOT NULL COMMENT '手順No',
    `explanation` VARCHAR(512) NOT NULL COMMENT '説明',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '作成時',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新時',
    PRIMARY KEY (`id`)
    );

CREATE TABLE IF NOT EXISTS `recipinder`.`recipe_user` (
    `id` MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT  'ID',
    `recipe_id` integer NOT NULL COMMENT 'レシピID',
    `user_id` VARCHAR(64) NOT NULL COMMENT 'ユーザID',
    `like` integer COMMENT 'like判定',
    PRIMARY KEY (`id`)
    );

CREATE TABLE IF NOT EXISTS `recipinder`.`review` (
    `id` VARCHAR(64) NOT NULL COMMENT 'ID',
    `recipe_id` integer COMMENT 'レシピID',
    `evaluation` integer NOT NULL COMMENT '評価',
    PRIMARY KEY (`id`)
    );

-- user
INSERT INTO users (id,name) VALUES ("1","rakko1");
INSERT INTO users (id,name) VALUES ("2","rakko2");



-- recipe
-- 肉
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("豚バラなすのニラまみれ","大きく切ったなすとやみつき甘辛だれの相性バツグン！ おつまみにも、おかずにも！「2WAY」で楽しめる旬レシピ♪ コチュジャンとニラの香りでクリアアサヒが進む♪ DELISH KITCHENキッチングッズも当たる！＜クリアアサヒ　ポイントプログラムキャンペーン＞については後半で紹介！ お家飲みはクリアアサヒで乾杯！ゴクゴクうまい！しみわたるうまさ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"豚バラ薄切り肉,なす,ニラ,塩こしょう,サラダ油,白いりごま,温泉卵",0,4,0,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("牛肉と小松菜のオイスター炒め","オイスターソースを使うことで、しっかりとしたコクのある味わいに♪卵を入れることで、満足感のある一品に。","https://image.delishkitchen.tv/recipe/232704830357898340/1.webp?version=1638860335&w=600",700,"牛こま切れ肉,小松菜,溶き卵,しょうゆ,おろししょうが,片栗粉,サラダ油",0,4,479,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("キャベツとチキンのトマトチーズ煮","キャベツは煮ることで甘味が増し、トマトの酸味ととても合います。鶏肉の旨味を吸ったキャベツが絶品です。","https://image.delishkitchen.tv/recipe/238630999993353322/1.webp?version=1639456561&w=600",500,"鶏もも肉,キャベツ,カットトマト缶,オリーブオイル,水,コンソメ,ピザ用チーズ",0,4,501,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("じゃがいもと鶏肉の甘辛炒め","鶏肉のジューシーさとじゃがいものホクホク食感がマッチ。お弁当のおかずにもオススメ。今晩のおかずにいかがでしょうか！","https://image.delishkitchen.tv/recipe/209495084838683866/1.webp?version=1647223487&w=600",300,"鶏もも肉,じゃがいも,塩こしょう,サラダ油,細ねぎ(刻み)",0,5,495,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("豚バラ大根のポン酢炒め","相性抜群の豚バラ肉と大根を組み合わせて、ポン酢でさっと炒めたスピードおかずを作りましょう。大根は薄切りにすることで味がしみ混みやすくなります。ごはんがもりもり進むこと間違いなし！","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"豚バラ薄切り肉,大根,サラダ油",0,4,477,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("基本の鶏ごぼう","シンプルな煮物料理をマスターして、今晩のおかずにしてみてください！旬の根菜などを入れるのもオススメです！","https://image.delishkitchen.tv/recipe/201083436671173713/1.webp?version=1618314542&w=600",400,"鶏もも肉,ごぼう,こんにゃく,しょうが,絹さや,酒,塩,サラダ油",0,5,274,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏もものオイスター漬け込み肉","オイスターソースを使った調味液で漬け込む事で、コクや旨味がアップします！長時間つけた後に香ばしく焼くことでしっとりジューシーに♪","https://image.delishkitchen.tv/recipe/203279414778134932/1.webp?version=1649985362&w=600",600,"鶏もも肉,塩こしょう,サラダ油",0,5,314,180);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏の角煮風","豚の角煮のようなこってりとした味わいに感動します♪味がしっかりとしてごはんが進むのでお弁当にも最適です♪","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏もも肉,ゆで卵,小松菜,サラダ油",0,5,526,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("ピーマン肉味噌","甘辛な味でやみつきになる、ピーマン肉味噌をご紹介です。しっかりとした味付けの肉味噌と合わせることでピーマンがたっぷり食べられる！さっと炒めて簡単にできるので忙しい時にもおすすめです。ごはんにのせて丼にしたり、おつまみにいかがでしょうか？","https://image.delishkitchen.tv/recipe/172088537053659539/1.webp?version=1643966751&w=600",300,"合びき肉,ピーマン,おろししょうが,サラダ油",0,5,347,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("豚バラ肉の大葉ロール","あいテレビ「金曜ほのボーノ！」で紹介されました！ 豚バラ肉と大葉をくるくると巻けば、断面がきれいな人気おかずが完成♪味付けはバターとポン酢の少ない調味料で簡単に仕上げます。","https://image.delishkitchen.tv/recipe/232704785915052329/1.webp?version=1645164482&w=600",500,"豚バラ薄切り肉,小松菜,大葉,塩こしょう,片栗粉,サラダ油,酒",0,4,493,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("ねぎだく塩レモンチキン","鶏肉をレモン汁で漬け込んでカリッと香ばしく焼き、チキンステーキにしました♪ねぎたっぷりのたれをかけてお召し上がりください！白ごはんの進む一品です。","https://image.delishkitchen.tv/recipe/251113239604102313/1.webp?version=1653878941&w=300",600,"鶏もも肉,長ねぎ,サラダ油,ごま油",0,6,311,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏肉としいたけのオイスター炒め","しいたけは大きめに切って食べ応えアップ♪オイスターソースが具材に絡んでご飯のお供にぴったりの一品です！今晩のおかずにいかがですか？","https://image.delishkitchen.tv/recipe/218613350672630043/1.webp?version=1638860335&w=300",400,"鶏もも肉,しいたけ,長ねぎ[白い部分],サラダ油",0,7,293,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏肉とアスパラのオイスター炒め","豚の角煮のようなこってりとした味わいに感動します♪味がしっかりとしてごはんが進むのでお弁当にも最適です♪","https://image.delishkitchen.tv/recipe/351657208745820462/1.webp?version=1643018281&w=300",400,"鶏もも肉,アスパラ,塩こしょう,サラダ油",0,3,314,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏むね肉としめじのポン酢煮","パサつきやすい鶏むね肉も、片栗粉をまぶしてコーティングし、ポン酢で煮ることでさらに柔らかくなります！さっぱりと食べられる一品です。","https://image.delishkitchen.tv/recipe/233537462666789343/1.webp?version=1638860334&w=300",400,"鶏むね肉[皮なし],しめじ,長ねぎ,片栗粉,サラダ油",0,2,261,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏むね肉ときのこのガリバタ炒め","あいテレビ「金曜ほのボーノ！」で紹介されました！ 下味効果でしっとりジューシーに仕上げた鶏むね肉に、旨味たっぷりのきのこを炒め合わせました。にんにくでパンチを効かせ、バター醤油の風味でコクのある一品に。ごはんがよく進むメニューです♪","https://image.delishkitchen.tv/recipe/259900528228566176/1.webp?version=1631585641&w=300",300,"鶏むね肉,エリンギ,しめじ,にんにく,サラダ油",0,4,317,20);


-- 魚
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭の甘酢あんかけ","鮭に野菜たっぷりの甘酢あんをかけてボリュームアップ♪甘酸っぱいとろとろあんで野菜がたくさん食べられます。片栗粉をまぶして香ばしく焼いた鮭の身はふっくら！しっかり味のおかずなので、さっぱりとしたお吸い物と一緒にどうぞ。","https://image.delishkitchen.tv/recipe/216467475372441883/1.webp?version=1638860334&w=300",500,"生鮭[切り身],玉ねぎ,にんじん,ピーマン,塩こしょう,片栗粉,サラダ油,酒,砂糖,しょうゆ,酢,和風顆粒だし,水,片栗粉,水",2,1,263,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭とほうれん草のバターソテー","あいテレビ「金曜ほのボーノ！」で紹介されました！ 香ばしく焼いた鮭でごはんが進む一品のご紹介！ふんわりとバターが香るほうれん草ソテーと鮭の相性が抜群♪シンプルな素材が味を引き立てます。味付けは醤油だけで味わい深く旨味がたっぷり♪葉物野菜を変えてみたり、きのこを加えたアレンジも楽しんでみて下さい！","https://image.delishkitchen.tv/recipe/265320354270938323/1.webp?version=1642123144&w=300",500,"生鮭[切り身],ほうれん草,玉ねぎ,塩こしょう,薄力粉,有塩バター,オリーブオイル,しょうゆ",2,2,256,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭と野菜のみそ焼き","野菜もたくさん食べられる鮭のホイル焼きレシピ♪しっかりとした甘辛みそ味で白いご飯のお代わりまちがいありません。フライパンで蒸し焼きにする簡単おかず！鮭とみその相性も抜群の一品です。","https://image.delishkitchen.tv/recipe/208033962012967968/1.webp?version=1638860334&w=300",500,"生鮭[切り身],キャベツ,にんじん,しめじ,細ねぎ(刻み),酒,砂糖,みそ",2,3,236,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("サーモンユッケ丼","コチュジャンとごま油を使うことで、風味豊かな一品に仕上げました。コチュジャンの量を調整してお召し上がりください♪","https://image.delishkitchen.tv/recipe/220209204625933471/1.webp?version=1657172042&w=300",400,"ごはん,どんぶり1杯(200g),サーモン[刺身],卵黄,白いりごま,刻みのり,細ねぎ(刻み),しょうゆ,ごま油,コチュジャン,おろしにんにく",2,1,628,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("サーモンフライ","こんがりきつね色が食欲をそそるサーモンフライのご紹介です！衣はマヨネーズを使うことでバッター液いらず！簡単でお手軽にフライができます！お好みでレモンを絞ってお召し上がりください♪","https://image.delishkitchen.tv/recipe/219542812532671704/1.webp?version=1602398042&w=300",1000,"サーモン[刺身用],塩こしょう,マヨネーズ,パン粉,サラダ油",2,2,574,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭とねぎのしょうが照り焼き","鮭を使った簡単に作れる照り焼きのレシピです。しょうがの風味がアクセントの箸がすすむ一品です♪","https://image.delishkitchen.tv/recipe/225280695130391005/1.webp?version=1546783202&w=300",500,"生鮭[切り身],長ねぎ[白い部分],しょうが,塩こしょう,片栗粉,サラダ油,酒,みりん,砂糖,しょうゆ",2,3,0,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭の塩昆布蒸し","シンプルな味付けで、コクのあるおいしさが楽しめます♪ レンジで手軽にできて、おつまみにもおすすめなレシピです。","https://image.delishkitchen.tv/recipe/216460146228855967/1.webp?version=1642150898&w=300",500,"生鮭[切り身],キャベツ,酒,塩こしょう,塩昆布,ごま油",2,1,209,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭とほうれん草のクリーム煮","塩焼きも美味しいけど、たまにはおしゃれな鮭のアレンジレシピをご紹介♪シチューの素がなくても作れるレシピです。草がたっぷり入ったとろ〜りクリームソースをからめてお召し上がりください。パン、ごはんにも合う人気の一品です！","https://image.delishkitchen.tv/recipe/265331270618186963/1.webp?version=1642643402&w=300",600,"生鮭[切り身],ほうれん草,塩こしょう,薄力粉,有塩バター,牛乳,塩,薄力粉",2,2,331,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("サーモンのごまだれ和え","ごまだれを作ったら漬けるだけ♪ごま油で風味付けしています。おつまみにもぴったりな一品です。","https://image.delishkitchen.tv/recipe/239936965598773733/1.webp?version=1638860334&w=300",400,"サーモン[刺身],細ねぎ(刻み),白いりごま,酒,砂糖,しょうゆ,白すりごま,ごま油",2,3,184,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("しめじと鮭のガーリックバター炒め","あいテレビ「金曜ほのボーノ！」で紹介されました！ にんにくとバターを使うことで、コクのある味わいに仕上げました！しめじの香りも良い一品です。ぜひ作ってみてください♪","https://image.delishkitchen.tv/recipe/212369861957911584/1.webp?version=1567736642&w=300",700,"サーモン[刺身],しめじ,にんにく,パセリ,有塩バター,塩こしょう,薄力粉,しょうゆ",2,1,305,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("サバの照り焼き","甘辛く煮絡めたサバは、ごはんとの相性抜群！さばは弱火でじっくりと焼いて身をふっくらと仕上げましょう。","https://image.delishkitchen.tv/recipe/216477197584565407/1.webp?version=1659510421&w=300",400,"サバ[3枚おろし],長ねぎ,塩,サラダ油,酒,みりん,しょうゆ,おろししょうが",2,2,336,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("基本のサバの味噌煮","和食の定番サバの味噌煮♪家庭でも簡単に作れる人気のレシピをご紹介します。トロトロになったねぎも甘くて美味しい！味噌がサバに絡んでご飯が進む一品です。","https://image.delishkitchen.tv/recipe/184837769833481248/1.webp?version=1638860334&w=300",300,"サバ,ねぎ,しょうが,水,みそ,酒,みりん,砂糖,しょうゆ",2,3,336,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("焼きサバのチリソースがけ","シンプルな焼きサバにピリ辛のチリソースが相性抜群です！フライパンで簡単に作れて挑戦しやすい一品♪ごはんにもぴったりの味付けです。ぜひお試しください。","https://image.delishkitchen.tv/recipe/317218507957732427/1.webp?version=1641954148&w=300",300,"サバ[切り身],長ねぎ,塩こしょう,サラダ油,砂糖,鶏ガラスープの素,ケチャップ,豆板醤,水",2,2,305,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("さばのしょうが焼き","豚肉のイメージが強いしょうが焼きを、さばで作ってみてはいかがでしょうか？甘辛いタレがさばと絡んで、ごはんにもよく合います。冷めても美味しいのでお弁当にもおすすめです♪","https://image.delishkitchen.tv/recipe/218180947290358109/1.webp?version=1638860334&w=300",400,"サバ[3枚おろし],豆苗,しょうが,塩,薄力粉,サラダ油,酒,みりん,しょうゆ",2,3,397,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("サバのカレーフライ","さっくり揚げたサバにカレーマヨネーズとレモンが相性ぴったり♪主菜にもおつまみにもなる1品です。","https://image.delishkitchen.tv/recipe/224643154463163411/1.webp?version=1643283182&w=300",600,"サバ[3枚おろし],塩こしょう,薄力粉,溶き卵,パン粉,サラダ油,レモン(くし形切り),マヨネーズ,カレー粉,パセリ(刻み)",2,2,354,20);

-- 野菜
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("基本の鶏ごぼう","シンプルな煮物料理をマスターして、今晩のおかずにしてみてください！旬の根菜などを入れるのもオススメです！","https://image.delishkitchen.tv/recipe/201083436671173713/1.webp?version=1618314542&w=300",400,"鶏もも肉,ごぼう,こんにゃく,しょうが,絹さや,酒,塩,サラダ油,酒,水,和風顆粒だし,みりん,砂糖,しょうゆ",1,1,274,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("たけのこと豚の角煮","ボリューム満点の角煮にたけのこをプラスして上品に仕上げましょう！お肉は下ゆですると余分な脂が落ちて味がしみやすくなります。","https://image.delishkitchen.tv/recipe/245603089124426074/1.webp?version=1636689961&w=300",800,"豚バラブロック肉,たけのこ[水煮],しょうが(薄切り),しょうゆ,水,酒,みりん,砂糖",1,2,584,60);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("しんなりレタスのわさび和え","レタスがタレに絡んで食べやすい！しんなり食感が癖になります♪お手軽副菜としてオススメです。","https://image.delishkitchen.tv/recipe/166892189819863532/1.webp?version=1638860334&w=300",100,"レタス,白いりごま,しょうゆ,わさび,塩,ごま油",1,3,80,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("レタスとツナのふんわり卵炒め","料理初心者の方でも、全ての材料を一緒に炒めるだけで、簡単に主菜が作れます！さっと炒めることで、卵もふんわり食感に♪","https://image.delishkitchen.tv/recipe/209638821841600934/1.webp?version=1618187523&w=300",200,"レタス,ツナ缶[オイル漬け],卵,サラダ油,細ねぎ(刻み),酒,めんつゆ[3倍濃縮],塩こしょう",1,1,287,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("なすとスナップエンドウの肉みそ炒め","みその香りとスナップエンドウの食感がアクセントになり、白ごはんがすすむおかずレシピのご紹介です！さっと炒めて、今晩のおかずにいかがでしょうか？","https://image.delishkitchen.tv/recipe/232711938277114980/1.webp?version=1638860335&w=300",800,"豚バラ薄切り肉,なす,スナップエンドウ,塩こしょう,サラダ油,酒,みりん,砂糖,みそ,白いりごま",1,2,585,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏肉とアスパラのオイスター炒め","鶏肉とアスパラを使った炒め物のご紹介です。オイスターソースを使ったコクのある味わいがごはんにぴったり♪アスパラの甘みと鶏肉のうまみがマッチした一品です！","https://image.delishkitchen.tv/recipe/351657208745820462/1.webp?version=1643018281&w=300",400,"鶏もも肉,アスパラ,塩こしょう,サラダ油,酒,砂糖,しょうゆ,オイスターソース",1,3,314,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("アボカドの和風ライス焼き","料理が面倒な人にオススメの、簡単レシピです♪アボカドごと器に、味付けしたごはんを入れて焼くだけなので、初心者の方でも簡単に作れます。","https://image.delishkitchen.tv/recipe/225755606911288569/1.webp?version=1638860335&w=300",200,"アボカド(大),ピザ用チーズ,ごはん,めんつゆ[3倍濃縮],かつお節",1,1,335,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("牛肉とアスパラの甘辛炒め","アスパラと牛肉をごはんにぴったりな甘辛い味付けでさっと炒めます。そのままごはんに乗せて丼にするのもおすすめです。","https://image.delishkitchen.tv/recipe/221505023320786136/1.webp?version=1648693142&w=300",600,"牛切り落とし肉,アスパラ,玉ねぎ,酒,片栗粉,ごま油,酒,砂糖,みりん,しょうゆ",1,2,332,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("たけのこのみそバター焼き","たけのこの水煮をみそとバターで香り高く炒めました♪やみつきになる味わいで夕食のおかずやお酒のお供にもおすすめのレシピです。調理時間10分なので忙しい日にもささっと作れます！","https://image.delishkitchen.tv/recipe/304896085388689743/1.webp?version=1609426803&w=300",400,"たけのこ[水煮],サラダ油,有塩バター,細ねぎ(刻み),酒,みりん,みそ",1,3,123,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("やみつきレタス","食べ始めたらクセになる、無限に食べられそうな人気のレタスレシピをご紹介♪レタスをちぎってあえるだけで簡単に作れます！レタスを大量消費したい時にぴったりな一品です。おつまみにいかがでしょうか。","https://image.delishkitchen.tv/recipe/165888708543775123/1.webp?version=1631774582&w=300",100,"レタス,塩,鶏がらスープの素,レモン汁,ごま油,白いりごま,おろしにんにく",1,1,80,5);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("えびとアボカドのオーロラソースサラダ","えびとアボカドの鉄板コンビで彩り良く♪食べ応えもたっぷりなサラダです♪おしゃれな朝食にいかがですか？","https://image.delishkitchen.tv/recipe/198329795598091296/1.webp?version=1605595262&w=300",800,"むきえび(ゆで),アボカド,玉ねぎ,ミニトマト,グリーンリーフ,マヨネーズ,ケチャップ,レモン汁,おろしにんにく,こしょう",1,2,372,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("レタスと塩昆布のスープ","食材は2つだけ！あっという間に作れて簡単♪味付けはシンプルですが、人気の塩昆布のうま味が美味しいスープです。献立に困ったときにもおすすめ！レタスはサニーレタスやロメインレタス、サンチュ、サラダ菜などでも作れます。レタスはさっと火を通してくださいね。","https://image.delishkitchen.tv/recipe/168745473274806764/1.webp?version=1638860334&w=300",100,"レタス,塩昆布,塩,ごま油,鶏ガラスープの素,白いりごま,水",1,4,42,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("アスパラのおかかバター炒め","アスパラを使って素材ひとつで作る副菜をご紹介します。バターとかつお節の香りが口いっぱいに広がってあとを引くおいしさです。パパッと作れるので、献立のあと一品やお弁当のすきまおかず、おつまみにおすすめです。","https://image.delishkitchen.tv/recipe/314299817549366335/1.webp?version=1615256102&w=300",200,"アスパラ,有塩バター,しょうゆ,かつお節",1,2,55,5);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("牛肉とたけのこのキムチ炒め","キムチのピリ辛味でごはんがすすむ♪牛肉は炒めすぎないことがおいしく仕上げるポイントです。たけのこの食感が楽しめるおかずです。","https://image.delishkitchen.tv/recipe/245862488170562729/1.webp?version=1646721422&w=300",900,"牛こま切れ肉,たけのこ[水煮],細ねぎ,キムチ,砂糖,しょうゆ,ごま油",1,3,263,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("菜の花と筍の酢みそあえ","酢みそのコクと甘み、酸味のバランスがちょうどいい！さっぱりと食べられる菜の花と筍の酢みそあえのご紹介です。手軽に作れる上品な小鉢です。","https://image.delishkitchen.tv/recipe/206177922514420759/1.webp?version=1643018822&w=300",600,"菜の花,たけのこ[水煮],砂糖,酢,しょうゆ,みそ",1,2,106,10);


-- その他
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("やみつき白菜わかめサラダ","シンプルな味付けが後をひくおいしさです♪ごま油の風味で食欲が増して箸が進む！おつまみにもぴったりな味付けです。","https://image.delishkitchen.tv/recipe/200055587847799142/1.webp?version=1644395942&w=600",100,"わかめ(乾燥),白菜,白いりごま,塩,鶏ガラスープの素,レモン汁,ごま油",3,1,132,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("ひじきと豆の煮物","ひじきと大豆を使った定番のひじき煮です。やさしい味にホッとする一品♪箸休めにはもちろん、お弁当のおかずにもおすすめです。ひじきはたっぷりの水で戻しましょう。","https://image.delishkitchen.tv/recipe/328368260875551022/1.webp?version=1659493021&w=600",200,"大豆[蒸し],油揚げ,ひじき(乾燥),にんじん,こんにゃく,サラダ油,酒,みりん,砂糖,しょうゆ,和風顆粒だし,水",3,2,184,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("ひじきと油揚げの炊き込みごはん","ひじきがたっぷり！シンプルな材料と味付けでお手軽に作れる炊き込みご飯です。だしの効いた優しい味付けがポイントです♪","https://image.delishkitchen.tv/recipe/216337192321024283/1.webp?version=1634182621&w=600",300,"米(洗米済み),油揚げ,芽ひじき,にんじん,水,酒,みりん,しょうゆ,和風顆粒だし",3,3,331,60);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("昆布だし","基本の出汁の取り方をマスターしましょう！使用する昆布は、利尻昆布、日高昆布、真昆布、羅臼昆布などがおすすめです。昆布の特徴によって旨味も変わってきますので、お好みの昆布を使用してみてください♪煮干しやかつお出汁に比べて簡単なので手軽に取り入れやすく、日々の料理に使えますよ。","https://image.delishkitchen.tv/recipe/197153869640238207/1.webp?version=1646818501&w=600",200,"昆布(乾燥),水",3,1,0,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("もやしとわかめのふんわり卵スープ","片栗粉でとろみをつけることで、卵がきれいにふわっと仕上がります。もやしはさっと火を通し、シャキッとした食感をお楽しみ下さい♪","https://image.delishkitchen.tv/recipe/237938270623761528/1.webp?version=1615184731&w=600",100,"卵,もやし,わかめ[乾燥],ごま油,塩,しょうゆ,鶏ガラスープの素,黒こしょう,おろししょうが,水,片栗粉,水",3,2,80,5);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("のりの佃煮","ごはんのお供にぴったりの一品です。一口食べるとのりの風味が口いっぱいに広がります。煮るだけなので簡単に作れます♪","https://image.delishkitchen.tv/recipe/212418915601482970/1.webp?version=1612862377&w=600",100,"焼きのり,和風顆粒だし,水,酒,みりん,砂糖,しょうゆ",3,3,130,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("わかめと豆腐のキムチ和え","簡単なのに、食べ応えもばっちりな和え物です。ごま油の風味とピリ辛な味付けが食欲をそそります♪豆腐はレンジで水切りし、手でちぎるので味しみがよく、時短にもなります！","https://image.delishkitchen.tv/recipe/349080491334304038/1.webp?version=1621004404&w=600",100,"木綿豆腐,わかめ[乾燥],キムチ,しょうゆ,ごま油,白すりごま",3,1,94,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("じゃがいもとひじきの和風ポテトサラダ","じゃがいもとひじきを使った和風副菜をご紹介します。じゃがいもはほっくりとした粉ふきいもに仕上げることで調味料との味なじみが良くなります。マヨネーズのコクとめんつゆの風味が合わさってパクパクと食べられるおいしさです。ツナ缶やちくわを加えてもおいしくお作りいただけます。ぜひお試しください♪","https://image.delishkitchen.tv/recipe/312960740162011428/1.webp?version=1641871797&w=600",200,"じゃがいも,芽ひじき,細ねぎ(刻み),砂糖,めんつゆ[3倍濃縮],白すりごま",3,2,173,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("えのきの海苔巻き上げ","安く手に入るえのきを使った、おつまみやちょっとした副菜におすすめのレシピのご紹介です♪めんつゆマヨで下味をつけることで、そのままでもおいしくいただけます。","https://image.delishkitchen.tv/recipe/252125501236184233/1.webp?version=1638860335&w=600",100,"えのき,めんつゆ[3倍濃縮],マヨネーズ,焼きのり(縦19cm×横7cm),片栗粉,サラダ油",3,3,214,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("玉ねぎとわかめの味噌汁","玉ねぎとわかめが具材の味噌汁を作ります。少ない材料で手間をかけずにパパッと作れるのが嬉しいポイント！玉ねぎの甘みがほっと落ち着く味わいでシンプルながら飽きのこない汁物です。献立に悩んだ時におすすめです。","https://image.delishkitchen.tv/recipe/306039177512747300/1.webp?version=1626140221&w=600",50,"玉ねぎ,わかめ[乾燥],和風顆粒だし,みそ,水",3,1,54,5);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("きゅうりとひじきのごまマヨあえ","きゅうりとひじきを使った副菜をご紹介します。きゅうりは千切りにして塩もみにすることで、シャキッとした食感はそのまま、しんなりとさせて食べやすく、味なじみを良くすることができます。マヨネーズのコクとめんつゆの風味が合わさってパクパクと食べられるおいしさです。ツナ缶やちくわを加えてもおいしくお作りいただけます。ぜひお試しください♪","https://image.delishkitchen.tv/recipe/312847197097952319/1.webp?version=1608170405&w=600",100,"きゅうり,芽ひじき,塩(塩もみ用),マヨネーズ,めんつゆ[3倍濃縮],白いりごま",3,1,106,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("レタスとわかめのサラダ","簡単に作れて、しんなりレタスとわかめの食感が楽しい一品！ 人気のごま油とにんにく風味で食欲がわいてきます♪","https://image.delishkitchen.tv/recipe/174833053468721574/1.webp?version=1651029781&w=600",100,"レタス,わかめ（乾燥）,塩,こしょう,ごま油,おろしにんにく,白すりごま",3,2,57,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("生わかめと玉ねぎのナムル","生わかめのジューシーな食感が楽しめるナムルの作り方をご紹介します。玉ねぎの食感と味わいがアクセントになり、やみつきになる一品です。シンプルな味付けなので、生わかめ本来の味わいをお楽しみください♪","https://image.delishkitchen.tv/recipe/297908498203672918/1.webp?version=1642998241&w=600",400,"わかめ,新玉ねぎ,塩,ごま油,おろしにんにく,白いりごま",3,3,53,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("しらすとわかめのごま油炒め","ごま油で炒めることで風味豊かな味わいに仕上げました！濃いめの味付けでおつまみ、ご飯のお供にもおすすめな一品です。ぜひお試しください。","https://image.delishkitchen.tv/recipe/242696705693188481/1.webp?version=1652869802&w=600",300,"わかめ[塩蔵],しらす干し,白いりごま,ごま油,酒,しょうゆ,おろししょうが",3,2,61,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("もやしとわかめのツナサラダ","もやしがたっぷりと入った具沢山でおかずにもなるサラダです。レンジで作れて洗い物も少なく済みます♪もう一品プラスしたい時におすすめです。","https://image.delishkitchen.tv/recipe/238070794742137217/1.webp?version=1638860334&w=300",200,"ツナ缶[オイル漬け],もやし,しめじ,わかめ[乾燥],砂糖,酢,しょうゆ,白いりごま,ごま油",3,4,79,10);

-- 手順説明
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (1,1,"なすはへたを切り落とし、縞目に皮をむく。包丁を斜めに入れ、回転させながら一口大に切る(乱切り)。ニラは根元を切り落とし、1cm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (1,2,"豚肉は5〜6cm幅に切り、塩こしょうをふる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (1,3,"ボウルに☆を入れて混ぜる(甘辛調味料)。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (1,4,"フライパンにサラダ油を入れて中火で熱し、2の豚肉を入れて炒める。肉の色が変わったらなすを加えてさっと炒め、ふたをして弱めの中火で2分蒸し焼きにする。ふたをとり、豚肉がカリッとするまで中火で炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (1,5,"甘辛調味料を加えて照りが出るまで炒め、ニラを加えてさっと炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (1,6,"器に盛り、白いりごまをふり、温泉卵をのせる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (2,1,"ボウルに牛肉、しょうゆ、おろししょうがを入れてよく揉み込み、3分程おき、片栗粉をまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (2,2,"小松菜は根元を切り落とし、3cm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (2,3,"フライパンに半量のサラダ油(大さじ1)を入れて熱し、溶き卵を入れて中火で炒め、半熟になったら取り出す。キッチンペーパーでフライパンの汚れをふきとり、残りのサラダ油(大さじ1)を入れて熱し、牛肉を入れて肉の色が変わるまで中火で炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (2,4,"小松菜を加えてさっと炒め合わせ、ふたをして1分程蒸し焼きにする。☆を加えて混ぜ、卵を戻し入れる。さっと炒め合わせて器に盛る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (3,1,"キャベツは食べやすい大きさに切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (3,2,"鶏肉は食べやすい大きさに切り、塩こしょうをふり、片栗粉をまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (3,3,"フライパンにオリーブオイルを入れて熱し、鶏肉の皮目を下にして並べ、焼き色がつくまで中火で焼く。裏に返して焼き色がつくまで焼き、キャベツを加えて全体に油がまわるまで炒める。カットトマト缶、水、コンソメを加え、煮立ったらふたをして7分程弱火で煮る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (3,4,"★を加えて水分をとばしながら5分程煮る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (3,5,"ピザ用チーズをかけ、ふたをしてチーズが溶けるまで2分程煮る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (3,6,"器に盛り、パセリをちらしてバゲットを添える。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (4,1,"じゃがいもは一口大に切り、耐熱容器に入れてふんわりとラップをし、600Wのレンジで5〜6分加熱する。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (4,2,"鶏肉は大きめの一口大に切り、塩こしょうをふる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (4,3,"フライパンにサラダ油を入れて熱し、鶏肉の皮目を下にして入れて、皮がカリッとするまで弱火で焼き、裏返して2〜3分焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (4,4,"3にじゃがいもを加え、油が全体に馴染むまで中火で炒め、☆を加えて全体にからまるように炒める。器に盛り、細ねぎをちらす。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (5,1,"大根は縦半分に切り、切り口を下にして薄切りにする(半月切り)。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (5,2,"豚肉は3cm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (5,3,"フライパンにサラダ油を入れて熱し、豚肉を入れて肉の色が変わるまで中火で炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (5,4,"大根を加えて色が透き通るまで炒め、☆を加えて水分を飛ばしながら炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (5,5,"器に盛り、細ねぎをちらす。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (6,1,"鶏肉は余分な脂や筋を除いて、一口大に切り、酒、塩をまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (6,2,"ごぼうは皮を包丁の背でこそげ落とし、きれいに洗って斜め1cm幅に切り、水に1分程さらして水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (6,3,"こんにゃくは、スプーンで一口大にちぎる。鍋にこんにゃく、かぶるくらいの水を入れて、2分程ゆでて水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (6,4,"しょうがは皮をむいて薄切りにする。絹さやは筋を取り、鍋に湯をわかして塩(分量外:少々)を入れてさっとゆで、水にとって冷まし、斜め半分に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (6,5,"鍋にサラダ油を入れて熱し、鶏肉を入れて中火で炒める。肉の色が変わったら、ごぼう、こんにゃくを加えて炒める。全体に油がまわったら、酒、水、和風顆粒だし、しょうがを加えて煮立たせる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (6,6,"煮立ったら、みりん、砂糖、しょうゆを加えて落としぶたをし、弱火で8〜10分煮る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (6,7,"落としぶたを取り、汁気がなくなるまで中火で煮詰める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (6,8,"器に盛り、絹さやを飾る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (7,1,"鶏肉はキッチンペーパーで水気を拭き取り、余分な脂肪や筋を取り除く。皮目にフォークで数箇所穴をあけ、塩こしょうをふる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (7,2,"保存袋に☆、1の鶏肉を入れてよく揉み込み、冷蔵庫で3時間程漬ける。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (7,3,"フライパンにサラダ油を入れて熱し、2の鶏肉を皮目から入れて中弱火で5〜6分程、こんがり焼き色がつくまで焼く。裏に返してふたをし、弱火で3〜4分焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (7,4,"食べやすい大きさに切り、器に盛る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (8,1,"小松菜は食べやすい長さに切る。耐熱容器に入れふんわりとラップをし、600Wのレンジで1分加熱して水にさらして粗熱をとり、水気を絞る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (8,2,"鶏肉はフォークで刺し、大きめの一口大に切り、片栗粉を薄くまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (8,3,"鍋にサラダ油を入れて熱し、鶏肉を加えて焼き色がつくまで転がしながら中火で焼き、☆、ゆで卵を加えて落としぶたと鍋の蓋をして5分程弱火で煮る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (8,4,"器に3、小松菜を盛る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (9,1,"ピーマンは半分に切り、種を取り除いて細切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (9,2,"フライパンにサラダ油を入れて熱し、合びき肉、おろししょうがを入れて肉の色が変わるまで炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (9,3,"2に☆を入れ、全体にからめるように弱火で炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (9,4,"3にピーマンを加え、ピーマンがしんなりするまで炒める。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (10,1,"大葉は軸を切り落とし、縦半分に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (10,2,"豚肉を1枚広げ、塩こしょう、片栗粉をふる。大葉を手前に1枚分を縦に並べてのせ、手前から巻く。同様にして計10個作る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (10,3,"フライパンにサラダ油を入れて熱し、2の巻き終わりを下にして並べて中火で焼く。焼き色がついたら転がして全面を焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (10,4,"酒を回し入れてふたをし、弱火で火が通るまで2分蒸し焼きにする。☆を加えてバターが溶けるまで炒めてからめる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (11,1,"鶏肉は余分な水分をキッチンペーパーでふきとる。 皮や身の間にある、黄色味がかった脂肪や筋を取り除く。 皮目を下にしておき、縦に4本浅く切り込みを入れる 。 裏返して皮にフォークなどで穴をあける。 ボウルに鶏肉、☆を入れて揉み込み、10分程おく。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (11,2,"ねぎは小口切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (11,3,"別のボウルに★を入れて混ぜる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (11,4,"フライパンにサラダ油を入れて熱し、鶏肉の皮目を下にして入れ、中火で4〜5分程こんがりと焼き色がつくまで焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (11,5,"裏に返してふたをして、弱火で3分程焼き、鶏肉に火が通ったら器に盛る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (11,6,"キッチンペーパーで余分な油を拭き取り、ごま油を入れて熱し、ねぎを入れて中火でさっと炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (11,7,"6を★に加え、鶏肉にかける。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (12,1,"しいたけは根元を切り落とし、4等分に切る。ねぎは斜め2cm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (12,2,"鶏肉は一口大に切って塩こしょうをふり、片栗粉をまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (12,3,"フライパンにサラダ油を入れて熱し、2の鶏肉を皮目を下にして入れ、両面にこんがりと焼き色がつき、肉に火が通るまで中火で焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (12,4,"しいたけ、ねぎを加えてしんなりするまで炒め、★を加えて炒め合わせる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (13,1,"アスパラは根から半分くらいまで皮をむき、食べやすい大きさに切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (13,2,"鶏肉は食べやすい大きさに切り、塩こしょうをふる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (13,3,"フライパンにごま油を入れて熱し、鶏肉を入れて肉の色が変わるまで中火で炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (13,4,"アスパラを加えて火が通るまで炒め、☆を加えて炒め合わせる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (14,1,"鶏肉は一口大に切る。ポリ袋に鶏肉、☆を入れてよく揉み込む。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (14,2,"しめじは軸を切り落とし、手でほぐす。ねぎは斜めに薄切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (14,3,"1の鶏肉に片栗粉をまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (14,4,"フライパンにサラダ油を入れて熱し、鶏肉を入れて肉の色が変わるまで中火で炒める。しめじ、ねぎを加えてさっと炒め合わせる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (14,5,"★を加えて煮立ったらふたをし、3分程煮る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (15,1,"エリンギは食べやすい大きさになるようにさく。しめじは根元を切り落とし、ほぐす。にんにくは薄切りにし、つまようじなどで芯を取り除く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (15,2,"鶏肉は一口大に切り、ボウルに入れて☆を加え、よく揉み込む。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (15,3,"フライパンにサラダ油、にんにくを入れて弱火で熱し、香りが立ったら鶏肉を加えてこんがりと焼き色がつくまで中火で3〜4分程焼く。鶏肉を裏に返し、エリンギ、しめじを加えて肉に火が通り、きのこがしんなりするまで炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (15,4,"★を加えてさっと炒め合わせる。");
-- 手順説明　魚
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (16,1,"玉ねぎは薄切りにする。にんじんは千切りにする。ピーマンは縦半分に切り、へたと種を取り除き、横に細切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (16,2,"生鮭はキッチンペーパーで水気をふきとる。両面に塩こしょうをふり、片栗粉をまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (16,3,"フライパンにサラダ油(大さじ1)を入れて熱し、鮭の皮目を下にして並べ入れる。焼き色がつくまで中火で焼き、裏に返す。ふたをして弱火で3分火が通るまで焼いて取り出す。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (16,4,"フライパンの汚れをキッチンペーパーでふきとり、サラダ油(大さじ1/2)を入れて熱する。玉ねぎ、にんじん、ピーマンを入れてしんなりとするまで中火で炒める。☆を加えて煮立たせ、水溶き片栗粉をまわし入れてとろみがつくまで煮詰める(甘酢あん)。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (16,5,"器に鮭を盛り、甘酢あんをかける。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (17,1,"生鮭は一口大に切る。塩こしょうをふり、薄力粉を薄くまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (17,2,"ほうれん草は根元を切り落として4cm幅に切る。玉ねぎは薄切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (17,3,"フライパンにバター、オリーブオイルを入れて熱し、玉ねぎを入れてしんなりするまで中火で炒める。玉ねぎを端によせ、鮭を皮目を下にして加え、表面に焼き色がつくまで上下を返しながら弱めの中火で焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (17,4,"ほうれん草を加えてしんなりするまで炒め、鍋肌からしょうゆをまわしながら加えてひと混ぜする。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (18,1,"キャベツは食べやすい大きさに切る。にんじんは縦3等分に切り、切り口を下にして薄切りにする(短冊切り)。しめじは根元を切り落とし、ほぐす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (18,2,"ボウルに☆を入れて混ぜる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (18,3,"アルミホイルにキャベツ、にんじんを半量ずつ広げ入れ、鮭1切れをのせる。鮭の周りにしめじを半量のせ、☆を半量かけて包む。同様に計2個作る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (18,4,"フライパンに3を並べ入れ、底から1cm程の水(分量外:適量)を入れ、ふたをして弱めの中火で10分程蒸し焼きにする。器に盛り、細ねぎをちらす。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (19,1,"サーモンは2cm角に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (19,2,"ボウルに☆、白いりごまを入れて混ぜ、サーモンを加えて混ぜる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (19,3,"器にごはんを盛り、刻みのり、2をのせ、中央に卵黄をのせて細ねぎをちらす。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (20,1,"サーモンは大きめの一口大に切り、塩こしょうをふる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (20,2,"ボウルにサーモン、マヨネーズを入れて混ぜる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (20,3,"2のサーモンにパン粉を全体につける。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (20,4,"鍋にサラダ油を底から2cm程入れて180℃まで熱し、3を入れて両面がきつね色になるまで2分程揚げる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (21,1,"生鮭は食べやすい大きさに切って塩こしょう、片栗粉をふる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (21,2,"ねぎは根元を切り落として4cm幅に切る。しょうがは千切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (21,3,"フライパンにサラダ油を入れて熱し、鮭を入れて上下を返しながら火が通るまで中火で焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (21,4,"鮭をフライパンの端によせ、ねぎを加えてねぎに焼き色がつくまで焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (21,5,"☆、しょうがを加えて混ぜながら煮からめる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (22,1,"キャベツは手で食べやすい大きさにちぎる。耐熱皿にキャベツ、鮭をのせる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (22,2,"☆を加えて、ふんわりとラップをして600Wのレンジで4分加熱する。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (23,1,"鮭は4等分に切り、塩こしょうをふる。薄力粉を薄くまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (23,2,"ほうれん草は根元を切り落として3cm幅に切る。耐熱容器に入れてふんわりとラップをして600Wのレンジで2分加熱する。水にさらし、水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (23,3,"フライパンにバターを入れて熱し、鮭を入れて焼き色がつくまで弱めの中火で焼き、上下を返して火が通るまで焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (23,4,"ほうれん草を加えて1〜2分程弱めの中火で炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (23,5,"薄力粉をふり入れて粉気がなくなるまで炒める。牛乳、塩を加えてとろみがつくまで混ぜながら弱火で3〜4分程煮る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (24,1,"ボウルに酒、砂糖、しょうゆを入れて混ぜ、ふんわりとラップをし、600Wのレンジで1分加熱して取り出し、粗熱をとる。残りの☆を加えて混ぜる(ごまだれ)。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (24,2,"サーモンは7mm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (24,3,"ごまだれにサーモンを加えて混ぜる。ラップをして冷蔵庫に入れて20分程漬ける。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (24,4,"器に盛り、細ねぎ、白いりごまをちらす。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (25,2,"サーモンは一口大に切り、塩こしょうをふり、薄力粉まぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (25,3,"フライパンにバターを入れて熱し、にんにくを入れて香りがたったらサーモンを入れてサーモンの色が変わるまで中火で両面焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (25,4,"サーモンを端に寄せ、しめじを加え、しんなりするまで炒め、全体を混ぜ合わせ、しょうゆを回し入れて全体をさっと中火で炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (25,5,"器に4を盛り、パセリをちらす。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (26,1,"サバは3等分に切る。塩をふって、5分程おいてキッチンペーパーで水気をふきとる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (26,2,"ねぎは根元と青い部分を切り落とし、4cm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (26,3,"フライパンにサラダ油を入れて熱し、サバを皮目を下にして入れて、ねぎを加える。焼き色がつくまで中火で焼いて裏に返し、3〜4分弱火で焼いてサバに火を通す。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (26,4,"☆を加えて、中火で煮立たせる。サバとねぎにからめながら、とろみがつくまで煮詰める。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (27,1,"サバは皮目に浅く切れ目を入れる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (27,2,"ねぎは4cm幅に切る。しょうがは千切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (27,3,"フライパンに水を入れて煮立たせ、☆、ねぎ、しょうがを加える。再び煮立たせ、サバを皮を上にして加える。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (27,4,"サバに煮汁をかけながら中火で煮る。サバの色が変わってきたら、落としぶたをして弱火で5分程煮る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (27,5,"4にみそを溶き入れて再び落としぶたをし、10分程煮る。器に盛り、サバに煮汁をかける。");


INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (28,1,"ねぎはみじん切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (28,2,"サバは2等分に切る。キッチンペーパーで水気をふきとり、塩こしょうをふる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (28,3,"ボウルにねぎ、☆を入れてよく混ぜ、ふんわりとラップをして600Wのレンジで1分ほど加熱する(チリソース)。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (28,4,"フライパンにサラダ油を入れて中火で熱し、サバを皮目から入れて焼き色がつくまで焼く。上下を返して火が通るまで3〜4分焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (28,5,"器に盛り、チリソースをかける。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (29,1,"サバはキッチンペーパーで水気をふきとり、半分に切って皮目に浅く切り込みを入れる。塩をふり、10分程おく。キッチンペーパーで出てきた水分をふきとり、薄力粉をまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (29,2,"豆苗は根元を切り落とし、長さを半分に切る。しょうがはすりおろす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (29,3,"フライパンに1/3量のサラダ油(大さじ1/2)を入れて熱し、豆苗を入れて中火でさっと炒め、取り出す。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (29,4,"同じフライパンに残りのサラダ油(大さじ1)を入れて熱し、サバを並べ入れて、中火で両面を2〜3分、焼き色がつくまで焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (29,5,"フライパンの汚れをキッチンペーパーでふきとり、しょうが、☆を加え、サバにたれを回しかけながら2〜3分煮詰める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (29,6,"器に豆苗、サバを盛り、お好みでフライパンに残ったたれをかける。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (30,1,"サバは食べやすい大きさに切り、塩こしょうをふる。薄力粉、溶き卵、パン粉の順に衣をつける。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (30,2,"ボウルに☆を入れて混ぜる(カレーソース)。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (30,3,"フライパンにサラダ油を底から1cm程度入れて170℃に熱し、1を入れて上下を返しながらきつね色になるまで揚げる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (30,4,"器に3を盛り、カレーソース、レモンを添える。");

-- 手順説明　野菜
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (31,1,"鶏肉は余分な脂や筋を除いて、一口大に切り、酒、塩をまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (31,2,"ごぼうは皮を包丁の背でこそげ落とし、きれいに洗って斜め1cm幅に切り、水に1分程さらして水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (31,3,"こんにゃくは、スプーンで一口大にちぎる。鍋にこんにゃく、かぶるくらいの水を入れて、2分程ゆでて水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (31,4,"しょうがは皮をむいて薄切りにする。絹さやは筋を取り、鍋に湯をわかして塩(分量外:少々)を入れてさっとゆで、水にとって冷まし、斜め半分に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (31,5,"鍋にサラダ油を入れて熱し、鶏肉を入れて中火で炒める。肉の色が変わったら、ごぼう、こんにゃくを加えて炒める。全体に油がまわったら、酒、水、和風顆粒だし、しょうがを加えて煮立たせる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (31,6,"煮立ったら、みりん、砂糖、しょうゆを加えて落としぶたをし、弱火で8〜10分煮る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (31,7,"落としぶたを取り、汁気がなくなるまで中火で煮詰める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (31,8,"器に盛り、絹さやを飾る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (32,1,"豚肉は2cm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (32,2,"たけのこは一口大に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (32,3,"鍋に豚肉、豚肉がかぶるくらいの水(分量外:適量)を入れて中火で熱する。煮立ったらアクを取り除いてしょうがを加え、20分程ゆでて水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (32,4,"鍋に豚肉を戻し入れ、水、☆を入れて中火で熱し、煮立ったら弱めの中火で15分程煮る。たけのこを加えてふたをし、10分煮る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (32,5,"しょうゆを加え、ふたをして弱火で10分煮る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (33,1,"レタスは食べやすい大きさにちぎり、耐熱容器に入れてふんわりとラップをし、600Wのレンジで1分加熱する。粗熱がとれたら水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (33,2,"ボウルに☆を入れて混ぜ、レタス、白いりごまを加えてあえる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (34,1,"レタスは芯を取り、手で食べやすい大きさにちぎる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (34,2,"ボウルに卵を割り入れて混ぜる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (34,3,"フライパンにサラダ油(大さじ1)を入れて熱し、2を入れて半熟になるまでさっと炒めて、取り出す。残りのサラダ油(大さじ1/2)を入れて熱し、レタス、ツナを加えてさっと炒める。卵を戻し入れて☆を加え、さっと炒め合わせる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (34,4,"器に盛り、細ねぎをちらす。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (35,1,"なすはへたを取り、一口大に切る。スナップエンドウは筋を取り、斜め半分に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (35,2,"豚肉は3cm幅に切り、塩こしょうをふる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (35,3,"ボウルに☆を入れて混ぜる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (35,4,"フライパンにサラダ油を入れて熱し、豚肉を入れて肉の色が変わり、カリッとするまで中火で炒める。なすを加えてやわらかくなるまで炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (35,5,"スナップエンドウを加えてさっと炒め、☆を加えて炒め合わせる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (36,1,"アスパラは根元を少し切り落としてピーラーで下半分の皮をむき、斜め3cm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (36,2,"鶏肉は一口大に切り、塩こしょうを全体にふる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (36,3,"フライパンにサラダ油を入れて熱し、鶏肉を皮目を下にして入れ、焼き色がつくまで中火で焼く。裏返し、2分ほど焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (36,4,"アスパラを加えて肉に火が通るまで2分ほど炒め、☆を加えて炒め合わせる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (37,1,"アボカドは縦に切り込みを入れて半分に切り、種を取り除く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (37,2,"ボウルに☆を入れて混ぜる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (37,3,"天板にアルミホイルを敷き、アボカドをのせ、くぼみに2を分け入れる。ピザ用チーズをのせ、トースターでこんがり焼き色がつくまで5〜10分程焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (37,4,"器に盛り、お好みでめんつゆをかける。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (38,2,"ボウルに牛肉を入れ、酒、片栗粉を加えて揉み込む。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (38,3,"フライパンにごま油を入れて熱し、牛肉を入れて中火で肉の色が変わるまで炒め、アスパラ、玉ねぎを加えて全体に油がまわるまで炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (38,4,"アスパラがしんなりとしたら☆を加えて炒め合わせる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (39,1,"たけのこは食べやすい大きさに切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (39,2,"ボウルに☆を入れて混ぜる(みそだれ)。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (39,3,"フライパンにサラダ油を入れて中火で熱し、たけのこを入れて両面に焼き色がつくまで2〜3分ほど焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (39,4,"バター、みそだれを加えてからめながら焼く。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (39,5,"器に盛り、細ねぎをちらす。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (40,1,"レタスは食べやすい大きさにちぎる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (40,2,"ボウルに☆を入れて混ぜる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (40,3,"レタスを入れて混ぜる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (41,1,"アボカドは半分に切り、種を取り、皮をむいて1cm角に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (41,2,"玉ねぎは薄切りにして10分程水にさらし、水気を切る。グリーンリーフは食べやすい大きさに手でちぎる。ミニトマトは縦に4等分に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (41,3,"ボウルに☆を入れて混ぜる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (41,4,"器にグリーンリーフ、玉ねぎ、アボカド、ミニトマト、むきえびを盛り、☆をかける。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (42,1,"レタスは千切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (42,2,"鍋に☆を入れて熱し、煮立ったらレタス、塩こんぶを入れて1分間煮る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (43,1,"アスパラは根元のかたい部分を切り落とし、下半分の皮をピーラーでむく。斜め4cm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (43,2,"フライパンにバターを入れて中火で熱し、溶け始めたらアスパラを入れて火が通るまで2分ほど炒める。しょうゆを加えてなじむまで炒める。火を止めてかつお節を加え、全体にあえる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (44,1,"たけのこは長さ4cm程の細切りにする。細ねぎは根元を切り落とし、4cm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (44,2,"フライパンにごま油を入れて中火で熱し、牛肉を入れて肉の色が変わるまで炒める。たけのこを加えて油が馴染むまで炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (44,3,"キムチ、砂糖を加えて炒め合わせる。細ねぎを加え、しょうゆをまわし入れてさっと炒める。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (45,1,"菜の花は根元を少し切り落とし、長さを半分に切る。たけのこは穂先と根元を切り分ける。穂先は縦半分に切り、切り口を下にして6等分の放射状に切る。根元は食べやすい大きさに切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (45,2,"鍋に湯をわかし、塩(分量外:小さじ1)、菜の花を入れて菜の花の茎がやわらかくなるまで2分ほどゆでる。水にさらして水気をしぼる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (45,3,"ボウルに☆を入れて混ぜる。菜の花、たけのこを加えてあえる。");

-- その他
-- 46 は偽物データ
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (46,1,"なすはへたを切り落とし、縞目に皮をむく。包丁を斜めに入れ、回転させながら一口大に切る(乱切り)。ニラは根元を切り落とし、1cm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (46,2,"豚肉は5〜6cm幅に切り、塩こしょうをふる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (46,3,"ボウルに☆を入れて混ぜる(甘辛調味料)。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (46,4,"フライパンにサラダ油を入れて中火で熱し、2の豚肉を入れて炒める。肉の色が変わったらなすを加えてさっと炒め、ふたをして弱めの中火で2分蒸し焼きにする。ふたをとり、豚肉がカリッとするまで中火で炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (46,5,"甘辛調味料を加えて照りが出るまで炒め、ニラを加えてさっと炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (46,6,"器に盛り、白いりごまをふり、温泉卵をのせる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (47,1,"ひじきはたっぷりの水で戻し、水気を切る。にんじんは千切りにする。こんにゃくは5mmの厚さに切り、さらに5mm幅に切る。鍋に湯をわかし、こんにゃくを入れて3分ほどゆでて水気を切る(アク抜き)。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (47,2,"油揚げは熱湯(分量外:適量)をかけ、水気を切る。粗熱をとり、短い辺を半分に切り、8mm幅に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (47,3,"フライパンにサラダ油を入れて中火で熱し、ひじき、にんじん、こんにゃくを入れて炒める。大豆、油揚げ、☆を加えて煮立ったらふたをし、弱火で3分ほど煮る。ふたをとり、煮汁が少なくなるまで中火で煮る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (48,1,"にんじんは細切りにする。油揚げはキッチンペーパーで油をふきとり、横半分に切って縦に細切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (48,2,"炊飯器の内釜に米、☆、水を2合の目盛りまで入れて混ぜ、米を平らにならす。芽ひじき、油揚げ、にんじんをのせて広げ、通常炊飯する。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (48,3,"炊き上がったらさっくりと混ぜ、器に盛る。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (49,1,"昆布は汚れがあれば、乾いた布巾でさっとふき、3cm角に切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (49,2,"鍋に水、昆布を入れて、1時間程度浸しておく。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (49,3,"鍋を弱火にかけ、じわじわ旨味を引き出す。鍋の縁にふつふつと小さな泡が立ち始めたら取り出す。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (50,1,"ボウルに卵を割り入れ、混ぜる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (50,2,"鍋に☆を入れて中火で熱し、煮立ったら、わかめ、もやしを加えて1分程煮る。水溶き片栗粉をまわし入れて煮立たせながらとろみをつける。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (50,3,"卵をまわし入れてゆっくりと混ぜる。ごま油をまわし入れる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (51,1,"鍋に和風顆粒だし、水を入れて中火にかけ、ふつふつとしてきたらのりを手でちぎりながら加え、弱火でふやかす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (51,2,"☆を加えて混ぜ、お好みの固さになるまで煮詰める。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (52,1,"豆腐はキッチンペーパーで包み、耐熱皿にのせて600Wのレンジで2分加熱する。水気を切って粗熱をとる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (52,2,"ボウルにたっぷりの水、わかめを入れて戻し、水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (52,3,"ボウルにキムチ、☆を入れて混ぜる。豆腐を手でちぎりながら加え、わかめを加えて混ぜる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (53,1,"ボウルに芽ひじき、たっぷりの水を入れ、袋の表示時間通りに戻し、水気をよく切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (53,2,"じゃがいもは6等分に切る。水に5分さらし、水気を切る。鍋にじゃがいもを入れて水(分量外:じゃがいもがひたる程度)を加えて中火で沸騰させる。ふたをして弱火で8〜10分じゃがいもがやわらかくなるまでゆでる。水気を切って鍋に戻し入れ、中火で熱する。じゃがいもが白っぽくなるまで混ぜながら水気をとばす。別のボウルに入れて粗熱をとる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (53,3,"じゃがいもが入ったボウルに芽ひじき、☆を加えてあえる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (53,4,"器に盛り、細ねぎをちらす。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (54,1,"えのきは根元を切り落とす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (54,2,"ボウルにめんつゆ、マヨネーズを入れて混ぜ、えのきを加えてさっと混ぜ、6等分に分ける。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (54,3,"焼きのりは6等分の長方形に切り分ける。2のえのきに巻き、同様に計6個作る。全面に片栗粉をまぶす。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (54,4,"フライパンにサラダ油を入れて熱し、3を入れてこんがりと焼き色がつくまで、転がしながら中火で焼く。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (55,1,"玉ねぎは薄切りにする。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (55,2,"鍋に水、和風顆粒だしを入れて中火で熱し、煮立たせる。玉ねぎを加え、しんなりとするまで弱火で2分ほど煮る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (55,3,"火を止め、みそを溶き入れる。わかめを加え、中火で熱して沸騰直前まであたためる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (56,1,"ボウルに芽ひじき、たっぷりの水を入れ、袋の表示時間通りに戻し、水気をよく切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (56,2,"きゅうりは両端を切り落とし、薄切りにする。別のボウルに入れて塩を加えて軽くもみこむ。5〜10分ほどおいてしんなりとさせ、水気をよくしぼる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (56,3,"別のボウルに芽ひじき、きゅうり、☆を入れてあえる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (57,1,"レタスは一口大に切る。わかめは水に入れてもどし、水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (57,2,"ボウルに☆を入れて混ぜ、レタス、わかめを加えて混ぜる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (58,1,"新玉ねぎは芯を取り除き、切り口を下にして横に薄切りにする。さっと水にさらして水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (58,2,"わかめは食べやすい大きさに切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (58,3,"ボウルに☆を入れて混ぜ、新玉ねぎ、わかめを加えてあえる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (59,1,"わかめは水で洗う。ボウルにわかめ、水(分量外:適量)を入れて3〜4分おく。水気を切り、食べやすい大きさに切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (59,2,"フライパンにごま油を入れて熱し、わかめ、しらす干しを入れて油がなじむまで中火で炒める。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (59,3,"☆を加えて炒め、水分が半分くらいになったら、白いりごまを加えて炒め合わせる。");

INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (60,2,"わかめは水につけて戻し、水気をよくしぼる。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (60,3,"耐熱容器にもやし、しめじ、水(分量外:大さじ1)を入れてふんわりとラップをし、600Wのレンジで4分加熱し、水気を切る。");
INSERT INTO recipe_process (recipe_id,number,explanation) VALUES (60,4,"ボウルに☆を入れて混ぜ、ツナ缶、3、わかめを加えて混ぜる。");


-- recipe mylist
-- recipe
-- CREATE TABLE IF NOT EXISTS `recipinder`.`recipe_user` (
--   `id` MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT  'ID',
--   `recipe_id` VARCHAR(64) NOT NULL COMMENT 'レシピID',
--     `user_id` VARCHAR(64) NOT NULL COMMENT 'ユーザID',
--     `like` integer COMMENT 'like判定',
--     PRIMARY KEY (`id`)
--     );


INSERT INTO recipe_user (recipe_id,user_id) VALUES (1,1);
INSERT INTO recipe_user (recipe_id,user_id) VALUES (2,1);
INSERT INTO recipe_user (recipe_id,user_id) VALUES (3,1);
INSERT INTO recipe_user (recipe_id,user_id) VALUES (4,1);
INSERT INTO recipe_user (recipe_id,user_id) VALUES (5,1);

-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"鶏モモ肉,卵",0,3);
--
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏モモ肉,卵",0,3);
-- INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation) VALUES ("niku","食ってみな飛ぶぞ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"鶏モモ肉,卵",0,3);

-- 肉
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("豚バラなすのニラまみれ","大きく切ったなすとやみつき甘辛だれの相性バツグン！ おつまみにも、おかずにも！「2WAY」で楽しめる旬レシピ♪ コチュジャンとニラの香りでクリアアサヒが進む♪ DELISH KITCHENキッチングッズも当たる！＜クリアアサヒ　ポイントプログラムキャンペーン＞については後半で紹介！ お家飲みはクリアアサヒで乾杯！ゴクゴクうまい！しみわたるうまさ","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"豚バラ薄切り肉,なす,ニラ,塩こしょう,サラダ油,白いりごま,温泉卵",0,4,0,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("牛肉と小松菜のオイスター炒め","オイスターソースを使うことで、しっかりとしたコクのある味わいに♪卵を入れることで、満足感のある一品に。","https://image.delishkitchen.tv/recipe/232704830357898340/1.webp?version=1638860335&w=600",700,"牛こま切れ肉,小松菜,溶き卵,しょうゆ,おろししょうが,片栗粉,サラダ油",0,4,479,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("キャベツとチキンのトマトチーズ煮","キャベツは煮ることで甘味が増し、トマトの酸味ととても合います。鶏肉の旨味を吸ったキャベツが絶品です。","https://image.delishkitchen.tv/recipe/238630999993353322/1.webp?version=1639456561&w=600",500,"鶏もも肉,キャベツ,カットトマト缶,オリーブオイル,水,コンソメ,ピザ用チーズ",0,4,501,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("じゃがいもと鶏肉の甘辛炒め","鶏肉のジューシーさとじゃがいものホクホク食感がマッチ。お弁当のおかずにもオススメ。今晩のおかずにいかがでしょうか！","https://image.delishkitchen.tv/recipe/209495084838683866/1.webp?version=1647223487&w=600",300,"鶏もも肉,じゃがいも,塩こしょう,サラダ油,細ねぎ(刻み)",0,5,495,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("豚バラ大根のポン酢炒め","相性抜群の豚バラ肉と大根を組み合わせて、ポン酢でさっと炒めたスピードおかずを作りましょう。大根は薄切りにすることで味がしみ混みやすくなります。ごはんがもりもり進むこと間違いなし！","https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600",500,"豚バラ薄切り肉,大根,サラダ油",0,4,477,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("基本の鶏ごぼう","シンプルな煮物料理をマスターして、今晩のおかずにしてみてください！旬の根菜などを入れるのもオススメです！","https://image.delishkitchen.tv/recipe/201083436671173713/1.webp?version=1618314542&w=600",400,"鶏もも肉,ごぼう,こんにゃく,しょうが,絹さや,酒,塩,サラダ油",0,5,274,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏もものオイスター漬け込み肉","オイスターソースを使った調味液で漬け込む事で、コクや旨味がアップします！長時間つけた後に香ばしく焼くことでしっとりジューシーに♪","https://image.delishkitchen.tv/recipe/203279414778134932/1.webp?version=1649985362&w=600",600,"鶏もも肉,塩こしょう,サラダ油",0,5,314,180);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏の角煮風","豚の角煮のようなこってりとした味わいに感動します♪味がしっかりとしてごはんが進むのでお弁当にも最適です♪","https://image.delishkitchen.tv/recipe/201390441034155089/1.webp?version=1639021741&w=600",500,"鶏もも肉,ゆで卵,小松菜,サラダ油",0,5,526,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("ピーマン肉味噌","甘辛な味でやみつきになる、ピーマン肉味噌をご紹介です。しっかりとした味付けの肉味噌と合わせることでピーマンがたっぷり食べられる！さっと炒めて簡単にできるので忙しい時にもおすすめです。ごはんにのせて丼にしたり、おつまみにいかがでしょうか？","https://image.delishkitchen.tv/recipe/172088537053659539/1.webp?version=1643966751&w=600",300,"合びき肉,ピーマン,おろししょうが,サラダ油",0,5,347,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("豚バラ肉の大葉ロール","あいテレビ「金曜ほのボーノ！」で紹介されました！ 豚バラ肉と大葉をくるくると巻けば、断面がきれいな人気おかずが完成♪味付けはバターとポン酢の少ない調味料で簡単に仕上げます。","https://image.delishkitchen.tv/recipe/232704785915052329/1.webp?version=1645164482&w=600",500,"豚バラ薄切り肉,小松菜,大葉,塩こしょう,片栗粉,サラダ油,酒",0,4,493,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("ねぎだく塩レモンチキン","鶏肉をレモン汁で漬け込んでカリッと香ばしく焼き、チキンステーキにしました♪ねぎたっぷりのたれをかけてお召し上がりください！白ごはんの進む一品です。","https://image.delishkitchen.tv/recipe/251113239604102313/1.webp?version=1653878941&w=300",600,"鶏もも肉,長ねぎ,サラダ油,ごま油",0,6,311,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏肉としいたけのオイスター炒め","しいたけは大きめに切って食べ応えアップ♪オイスターソースが具材に絡んでご飯のお供にぴったりの一品です！今晩のおかずにいかがですか？","https://image.delishkitchen.tv/recipe/218613350672630043/1.webp?version=1638860335&w=300",400,"鶏もも肉,しいたけ,長ねぎ[白い部分],サラダ油",0,7,293,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏肉とアスパラのオイスター炒め","豚の角煮のようなこってりとした味わいに感動します♪味がしっかりとしてごはんが進むのでお弁当にも最適です♪","https://image.delishkitchen.tv/recipe/351657208745820462/1.webp?version=1643018281&w=300",400,"鶏もも肉,アスパラ,塩こしょう,サラダ油",0,3,314,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏むね肉としめじのポン酢煮","パサつきやすい鶏むね肉も、片栗粉をまぶしてコーティングし、ポン酢で煮ることでさらに柔らかくなります！さっぱりと食べられる一品です。","https://image.delishkitchen.tv/recipe/233537462666789343/1.webp?version=1638860334&w=300",400,"鶏むね肉[皮なし],しめじ,長ねぎ,片栗粉,サラダ油",0,2,261,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏むね肉ときのこのガリバタ炒め","あいテレビ「金曜ほのボーノ！」で紹介されました！ 下味効果でしっとりジューシーに仕上げた鶏むね肉に、旨味たっぷりのきのこを炒め合わせました。にんにくでパンチを効かせ、バター醤油の風味でコクのある一品に。ごはんがよく進むメニューです♪","https://image.delishkitchen.tv/recipe/259900528228566176/1.webp?version=1631585641&w=300",300,"鶏むね肉,エリンギ,しめじ,にんにく,サラダ油",0,4,317,20);

-- 魚
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭の甘酢あんかけ","鮭に野菜たっぷりの甘酢あんをかけてボリュームアップ♪甘酸っぱいとろとろあんで野菜がたくさん食べられます。片栗粉をまぶして香ばしく焼いた鮭の身はふっくら！しっかり味のおかずなので、さっぱりとしたお吸い物と一緒にどうぞ。","https://image.delishkitchen.tv/recipe/216467475372441883/1.webp?version=1638860334&w=300",500,"生鮭[切り身],玉ねぎ,にんじん,ピーマン,塩こしょう,片栗粉,サラダ油,酒,砂糖,しょうゆ,酢,和風顆粒だし,水,片栗粉,水",2,1,263,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭とほうれん草のバターソテー","あいテレビ「金曜ほのボーノ！」で紹介されました！ 香ばしく焼いた鮭でごはんが進む一品のご紹介！ふんわりとバターが香るほうれん草ソテーと鮭の相性が抜群♪シンプルな素材が味を引き立てます。味付けは醤油だけで味わい深く旨味がたっぷり♪葉物野菜を変えてみたり、きのこを加えたアレンジも楽しんでみて下さい！","https://image.delishkitchen.tv/recipe/265320354270938323/1.webp?version=1642123144&w=300",500,"生鮭[切り身],ほうれん草,玉ねぎ,塩こしょう,薄力粉,有塩バター,オリーブオイル,しょうゆ",2,2,256,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭と野菜のみそ焼き","野菜もたくさん食べられる鮭のホイル焼きレシピ♪しっかりとした甘辛みそ味で白いご飯のお代わりまちがいありません。フライパンで蒸し焼きにする簡単おかず！鮭とみその相性も抜群の一品です。","https://image.delishkitchen.tv/recipe/208033962012967968/1.webp?version=1638860334&w=300",500,"生鮭[切り身],キャベツ,にんじん,しめじ,細ねぎ(刻み),酒,砂糖,みそ",2,3,236,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("サーモンユッケ丼","コチュジャンとごま油を使うことで、風味豊かな一品に仕上げました。コチュジャンの量を調整してお召し上がりください♪","https://image.delishkitchen.tv/recipe/220209204625933471/1.webp?version=1657172042&w=300",400,"ごはん,どんぶり1杯(200g),サーモン[刺身],卵黄,白いりごま,刻みのり,細ねぎ(刻み),しょうゆ,ごま油,コチュジャン,おろしにんにく",2,1,628,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("サーモンフライ","こんがりきつね色が食欲をそそるサーモンフライのご紹介です！衣はマヨネーズを使うことでバッター液いらず！簡単でお手軽にフライができます！お好みでレモンを絞ってお召し上がりください♪","https://image.delishkitchen.tv/recipe/219542812532671704/1.webp?version=1602398042&w=300",1000,"サーモン[刺身用],塩こしょう,マヨネーズ,パン粉,サラダ油",2,2,574,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭とねぎのしょうが照り焼き","鮭を使った簡単に作れる照り焼きのレシピです。しょうがの風味がアクセントの箸がすすむ一品です♪","https://image.delishkitchen.tv/recipe/225280695130391005/1.webp?version=1546783202&w=300",500,"生鮭[切り身],長ねぎ[白い部分],しょうが,塩こしょう,片栗粉,サラダ油,酒,みりん,砂糖,しょうゆ",2,3,0,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭の塩昆布蒸し","シンプルな味付けで、コクのあるおいしさが楽しめます♪ レンジで手軽にできて、おつまみにもおすすめなレシピです。","https://image.delishkitchen.tv/recipe/216460146228855967/1.webp?version=1642150898&w=300",500,"生鮭[切り身],キャベツ,酒,塩こしょう,塩昆布,ごま油",2,1,209,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鮭とほうれん草のクリーム煮","塩焼きも美味しいけど、たまにはおしゃれな鮭のアレンジレシピをご紹介♪シチューの素がなくても作れるレシピです。草がたっぷり入ったとろ〜りクリームソースをからめてお召し上がりください。パン、ごはんにも合う人気の一品です！","https://image.delishkitchen.tv/recipe/265331270618186963/1.webp?version=1642643402&w=300",600,"生鮭[切り身],ほうれん草,塩こしょう,薄力粉,有塩バター,牛乳,塩,薄力粉",2,2,331,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("サーモンのごまだれ和え","ごまだれを作ったら漬けるだけ♪ごま油で風味付けしています。おつまみにもぴったりな一品です。","https://image.delishkitchen.tv/recipe/239936965598773733/1.webp?version=1638860334&w=300",400,"サーモン[刺身],細ねぎ(刻み),白いりごま,酒,砂糖,しょうゆ,白すりごま,ごま油",2,3,184,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("しめじと鮭のガーリックバター炒め","あいテレビ「金曜ほのボーノ！」で紹介されました！ にんにくとバターを使うことで、コクのある味わいに仕上げました！しめじの香りも良い一品です。ぜひ作ってみてください♪","https://image.delishkitchen.tv/recipe/212369861957911584/1.webp?version=1567736642&w=300",700,"サーモン[刺身],しめじ,にんにく,パセリ,有塩バター,塩こしょう,薄力粉,しょうゆ",2,1,305,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("サバの照り焼き","甘辛く煮絡めたサバは、ごはんとの相性抜群！さばは弱火でじっくりと焼いて身をふっくらと仕上げましょう。","https://image.delishkitchen.tv/recipe/216477197584565407/1.webp?version=1659510421&w=300",400,"サバ[3枚おろし],長ねぎ,塩,サラダ油,酒,みりん,しょうゆ,おろししょうが",2,2,336,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("基本のサバの味噌煮","和食の定番サバの味噌煮♪家庭でも簡単に作れる人気のレシピをご紹介します。トロトロになったねぎも甘くて美味しい！味噌がサバに絡んでご飯が進む一品です。","https://image.delishkitchen.tv/recipe/184837769833481248/1.webp?version=1638860334&w=300",300,"サバ,ねぎ,しょうが,水,みそ,酒,みりん,砂糖,しょうゆ",2,3,336,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("焼きサバのチリソースがけ","シンプルな焼きサバにピリ辛のチリソースが相性抜群です！フライパンで簡単に作れて挑戦しやすい一品♪ごはんにもぴったりの味付けです。ぜひお試しください。","https://image.delishkitchen.tv/recipe/317218507957732427/1.webp?version=1641954148&w=300",300,"サバ[切り身],長ねぎ,塩こしょう,サラダ油,砂糖,鶏ガラスープの素,ケチャップ,豆板醤,水",2,2,305,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("さばのしょうが焼き","豚肉のイメージが強いしょうが焼きを、さばで作ってみてはいかがでしょうか？甘辛いタレがさばと絡んで、ごはんにもよく合います。冷めても美味しいのでお弁当にもおすすめです♪","https://image.delishkitchen.tv/recipe/218180947290358109/1.webp?version=1638860334&w=300",400,"サバ[3枚おろし],豆苗,しょうが,塩,薄力粉,サラダ油,酒,みりん,しょうゆ",2,3,397,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("サバのカレーフライ","さっくり揚げたサバにカレーマヨネーズとレモンが相性ぴったり♪主菜にもおつまみにもなる1品です。","https://image.delishkitchen.tv/recipe/224643154463163411/1.webp?version=1643283182&w=300",600,"サバ[3枚おろし],塩こしょう,薄力粉,溶き卵,パン粉,サラダ油,レモン(くし形切り),マヨネーズ,カレー粉,パセリ(刻み)",2,2,354,20);

-- 野菜
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("基本の鶏ごぼう","シンプルな煮物料理をマスターして、今晩のおかずにしてみてください！旬の根菜などを入れるのもオススメです！","https://image.delishkitchen.tv/recipe/201083436671173713/1.webp?version=1618314542&w=300",400,"鶏もも肉,ごぼう,こんにゃく,しょうが,絹さや,酒,塩,サラダ油,酒,水,和風顆粒だし,みりん,砂糖,しょうゆ",1,1,274,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("たけのこと豚の角煮","ボリューム満点の角煮にたけのこをプラスして上品に仕上げましょう！お肉は下ゆですると余分な脂が落ちて味がしみやすくなります。","https://image.delishkitchen.tv/recipe/245603089124426074/1.webp?version=1636689961&w=300",800,"豚バラブロック肉,たけのこ[水煮],しょうが(薄切り),しょうゆ,水,酒,みりん,砂糖",1,2,584,60);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("しんなりレタスのわさび和え","レタスがタレに絡んで食べやすい！しんなり食感が癖になります♪お手軽副菜としてオススメです。","https://image.delishkitchen.tv/recipe/166892189819863532/1.webp?version=1638860334&w=300",100,"レタス,白いりごま,しょうゆ,わさび,塩,ごま油",1,3,80,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("レタスとツナのふんわり卵炒め","料理初心者の方でも、全ての材料を一緒に炒めるだけで、簡単に主菜が作れます！さっと炒めることで、卵もふんわり食感に♪","https://image.delishkitchen.tv/recipe/209638821841600934/1.webp?version=1618187523&w=300",200,"レタス,ツナ缶[オイル漬け],卵,サラダ油,細ねぎ(刻み),酒,めんつゆ[3倍濃縮],塩こしょう",1,1,287,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("なすとスナップエンドウの肉みそ炒め","みその香りとスナップエンドウの食感がアクセントになり、白ごはんがすすむおかずレシピのご紹介です！さっと炒めて、今晩のおかずにいかがでしょうか？","https://image.delishkitchen.tv/recipe/232711938277114980/1.webp?version=1638860335&w=300",800,"豚バラ薄切り肉,なす,スナップエンドウ,塩こしょう,サラダ油,酒,みりん,砂糖,みそ,白いりごま",1,2,585,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("鶏肉とアスパラのオイスター炒め","鶏肉とアスパラを使った炒め物のご紹介です。オイスターソースを使ったコクのある味わいがごはんにぴったり♪アスパラの甘みと鶏肉のうまみがマッチした一品です！","https://image.delishkitchen.tv/recipe/351657208745820462/1.webp?version=1643018281&w=300",400,"鶏もも肉,アスパラ,塩こしょう,サラダ油,酒,砂糖,しょうゆ,オイスターソース",1,3,314,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("アボカドの和風ライス焼き","料理が面倒な人にオススメの、簡単レシピです♪アボカドごと器に、味付けしたごはんを入れて焼くだけなので、初心者の方でも簡単に作れます。","https://image.delishkitchen.tv/recipe/225755606911288569/1.webp?version=1638860335&w=300",200,"アボカド(大),ピザ用チーズ,ごはん,めんつゆ[3倍濃縮],かつお節",1,1,335,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("牛肉とアスパラの甘辛炒め","アスパラと牛肉をごはんにぴったりな甘辛い味付けでさっと炒めます。そのままごはんに乗せて丼にするのもおすすめです。","https://image.delishkitchen.tv/recipe/221505023320786136/1.webp?version=1648693142&w=300",600,"牛切り落とし肉,アスパラ,玉ねぎ,酒,片栗粉,ごま油,酒,砂糖,みりん,しょうゆ",1,2,332,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("たけのこのみそバター焼き","たけのこの水煮をみそとバターで香り高く炒めました♪やみつきになる味わいで夕食のおかずやお酒のお供にもおすすめのレシピです。調理時間10分なので忙しい日にもささっと作れます！","https://image.delishkitchen.tv/recipe/304896085388689743/1.webp?version=1609426803&w=300",400,"たけのこ[水煮],サラダ油,有塩バター,細ねぎ(刻み),酒,みりん,みそ",1,3,123,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("やみつきレタス","食べ始めたらクセになる、無限に食べられそうな人気のレタスレシピをご紹介♪レタスをちぎってあえるだけで簡単に作れます！レタスを大量消費したい時にぴったりな一品です。おつまみにいかがでしょうか。","https://image.delishkitchen.tv/recipe/165888708543775123/1.webp?version=1631774582&w=300",100,"レタス,塩,鶏がらスープの素,レモン汁,ごま油,白いりごま,おろしにんにく",1,1,80,5);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("えびとアボカドのオーロラソースサラダ","えびとアボカドの鉄板コンビで彩り良く♪食べ応えもたっぷりなサラダです♪おしゃれな朝食にいかがですか？","https://image.delishkitchen.tv/recipe/198329795598091296/1.webp?version=1605595262&w=300",800,"むきえび(ゆで),アボカド,玉ねぎ,ミニトマト,グリーンリーフ,マヨネーズ,ケチャップ,レモン汁,おろしにんにく,こしょう",1,2,372,20);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("レタスと塩昆布のスープ","食材は2つだけ！あっという間に作れて簡単♪味付けはシンプルですが、人気の塩昆布のうま味が美味しいスープです。献立に困ったときにもおすすめ！レタスはサニーレタスやロメインレタス、サンチュ、サラダ菜などでも作れます。レタスはさっと火を通してくださいね。","https://image.delishkitchen.tv/recipe/168745473274806764/1.webp?version=1638860334&w=300",100,"レタス,塩昆布,塩,ごま油,鶏ガラスープの素,白いりごま,水",1,4,42,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("アスパラのおかかバター炒め","アスパラを使って素材ひとつで作る副菜をご紹介します。バターとかつお節の香りが口いっぱいに広がってあとを引くおいしさです。パパッと作れるので、献立のあと一品やお弁当のすきまおかず、おつまみにおすすめです。","https://image.delishkitchen.tv/recipe/314299817549366335/1.webp?version=1615256102&w=300",200,"アスパラ,有塩バター,しょうゆ,かつお節",1,2,55,5);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("牛肉とたけのこのキムチ炒め","キムチのピリ辛味でごはんがすすむ♪牛肉は炒めすぎないことがおいしく仕上げるポイントです。たけのこの食感が楽しめるおかずです。","https://image.delishkitchen.tv/recipe/245862488170562729/1.webp?version=1646721422&w=300",900,"牛こま切れ肉,たけのこ[水煮],細ねぎ,キムチ,砂糖,しょうゆ,ごま油",1,3,263,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("菜の花と筍の酢みそあえ","酢みそのコクと甘み、酸味のバランスがちょうどいい！さっぱりと食べられる菜の花と筍の酢みそあえのご紹介です。手軽に作れる上品な小鉢です。","https://image.delishkitchen.tv/recipe/206177922514420759/1.webp?version=1643018822&w=300",600,"菜の花,たけのこ[水煮],砂糖,酢,しょうゆ,みそ",1,2,106,10);

-- その他
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("やみつき白菜わかめサラダ","シンプルな味付けが後をひくおいしさです♪ごま油の風味で食欲が増して箸が進む！おつまみにもぴったりな味付けです。","https://image.delishkitchen.tv/recipe/200055587847799142/1.webp?version=1644395942&w=600",100,"わかめ(乾燥),白菜,白いりごま,塩,鶏ガラスープの素,レモン汁,ごま油",3,1,132,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("ひじきと豆の煮物","ひじきと大豆を使った定番のひじき煮です。やさしい味にホッとする一品♪箸休めにはもちろん、お弁当のおかずにもおすすめです。ひじきはたっぷりの水で戻しましょう。","https://image.delishkitchen.tv/recipe/328368260875551022/1.webp?version=1659493021&w=600",200,"大豆[蒸し],油揚げ,ひじき(乾燥),にんじん,こんにゃく,サラダ油,酒,みりん,砂糖,しょうゆ,和風顆粒だし,水",3,2,184,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("ひじきと油揚げの炊き込みごはん","ひじきがたっぷり！シンプルな材料と味付けでお手軽に作れる炊き込みご飯です。だしの効いた優しい味付けがポイントです♪","https://image.delishkitchen.tv/recipe/216337192321024283/1.webp?version=1634182621&w=600",300,"米(洗米済み),油揚げ,芽ひじき,にんじん,水,酒,みりん,しょうゆ,和風顆粒だし",3,3,331,60);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("昆布だし","基本の出汁の取り方をマスターしましょう！使用する昆布は、利尻昆布、日高昆布、真昆布、羅臼昆布などがおすすめです。昆布の特徴によって旨味も変わってきますので、お好みの昆布を使用してみてください♪煮干しやかつお出汁に比べて簡単なので手軽に取り入れやすく、日々の料理に使えますよ。","https://image.delishkitchen.tv/recipe/197153869640238207/1.webp?version=1646818501&w=600",200,"昆布(乾燥),水",3,1,0,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("もやしとわかめのふんわり卵スープ","片栗粉でとろみをつけることで、卵がきれいにふわっと仕上がります。もやしはさっと火を通し、シャキッとした食感をお楽しみ下さい♪","https://image.delishkitchen.tv/recipe/237938270623761528/1.webp?version=1615184731&w=600",100,"卵,もやし,わかめ[乾燥],ごま油,塩,しょうゆ,鶏ガラスープの素,黒こしょう,おろししょうが,水,片栗粉,水",3,2,80,5);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("のりの佃煮","ごはんのお供にぴったりの一品です。一口食べるとのりの風味が口いっぱいに広がります。煮るだけなので簡単に作れます♪","https://image.delishkitchen.tv/recipe/212418915601482970/1.webp?version=1612862377&w=600",100,"焼きのり,和風顆粒だし,水,酒,みりん,砂糖,しょうゆ",3,3,130,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("わかめと豆腐のキムチ和え","簡単なのに、食べ応えもばっちりな和え物です。ごま油の風味とピリ辛な味付けが食欲をそそります♪豆腐はレンジで水切りし、手でちぎるので味しみがよく、時短にもなります！","https://image.delishkitchen.tv/recipe/349080491334304038/1.webp?version=1621004404&w=600",100,"木綿豆腐,わかめ[乾燥],キムチ,しょうゆ,ごま油,白すりごま",3,1,94,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("じゃがいもとひじきの和風ポテトサラダ","じゃがいもとひじきを使った和風副菜をご紹介します。じゃがいもはほっくりとした粉ふきいもに仕上げることで調味料との味なじみが良くなります。マヨネーズのコクとめんつゆの風味が合わさってパクパクと食べられるおいしさです。ツナ缶やちくわを加えてもおいしくお作りいただけます。ぜひお試しください♪","https://image.delishkitchen.tv/recipe/312960740162011428/1.webp?version=1641871797&w=600",200,"じゃがいも,芽ひじき,細ねぎ(刻み),砂糖,めんつゆ[3倍濃縮],白すりごま",3,2,173,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("えのきの海苔巻き上げ","安く手に入るえのきを使った、おつまみやちょっとした副菜におすすめのレシピのご紹介です♪めんつゆマヨで下味をつけることで、そのままでもおいしくいただけます。","https://image.delishkitchen.tv/recipe/252125501236184233/1.webp?version=1638860335&w=600",100,"えのき,めんつゆ[3倍濃縮],マヨネーズ,焼きのり(縦19cm×横7cm),片栗粉,サラダ油",3,3,214,15);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("玉ねぎとわかめの味噌汁","玉ねぎとわかめが具材の味噌汁を作ります。少ない材料で手間をかけずにパパッと作れるのが嬉しいポイント！玉ねぎの甘みがほっと落ち着く味わいでシンプルながら飽きのこない汁物です。献立に悩んだ時におすすめです。","https://image.delishkitchen.tv/recipe/306039177512747300/1.webp?version=1626140221&w=600",50,"玉ねぎ,わかめ[乾燥],和風顆粒だし,みそ,水",3,1,54,5);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("きゅうりとひじきのごまマヨあえ","きゅうりとひじきを使った副菜をご紹介します。きゅうりは千切りにして塩もみにすることで、シャキッとした食感はそのまま、しんなりとさせて食べやすく、味なじみを良くすることができます。マヨネーズのコクとめんつゆの風味が合わさってパクパクと食べられるおいしさです。ツナ缶やちくわを加えてもおいしくお作りいただけます。ぜひお試しください♪","https://image.delishkitchen.tv/recipe/312847197097952319/1.webp?version=1608170405&w=600",100,"きゅうり,芽ひじき,塩(塩もみ用),マヨネーズ,めんつゆ[3倍濃縮],白いりごま",3,1,106,30);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("レタスとわかめのサラダ","簡単に作れて、しんなりレタスとわかめの食感が楽しい一品！ 人気のごま油とにんにく風味で食欲がわいてきます♪","https://image.delishkitchen.tv/recipe/174833053468721574/1.webp?version=1651029781&w=600",100,"レタス,わかめ（乾燥）,塩,こしょう,ごま油,おろしにんにく,白すりごま",3,2,57,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("生わかめと玉ねぎのナムル","生わかめのジューシーな食感が楽しめるナムルの作り方をご紹介します。玉ねぎの食感と味わいがアクセントになり、やみつきになる一品です。シンプルな味付けなので、生わかめ本来の味わいをお楽しみください♪","https://image.delishkitchen.tv/recipe/297908498203672918/1.webp?version=1642998241&w=600",400,"わかめ,新玉ねぎ,塩,ごま油,おろしにんにく,白いりごま",3,3,53,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("しらすとわかめのごま油炒め","ごま油で炒めることで風味豊かな味わいに仕上げました！濃いめの味付けでおつまみ、ご飯のお供にもおすすめな一品です。ぜひお試しください。","https://image.delishkitchen.tv/recipe/242696705693188481/1.webp?version=1652869802&w=600",300,"わかめ[塩蔵],しらす干し,白いりごま,ごま油,酒,しょうゆ,おろししょうが",3,2,61,10);
INSERT INTO recipis (recipe_name,description,url,place,ingredients,tag,evaluation,kcal,time) VALUES ("もやしとわかめのツナサラダ","もやしがたっぷりと入った具沢山でおかずにもなるサラダです。レンジで作れて洗い物も少なく済みます♪もう一品プラスしたい時におすすめです。","https://image.delishkitchen.tv/recipe/238070794742137217/1.webp?version=1638860334&w=300",200,"ツナ缶[オイル漬け],もやし,しめじ,わかめ[乾燥],砂糖,酢,しょうゆ,白いりごま,ごま油",3,4,79,10);