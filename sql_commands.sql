
drop table if exists shared_tweet;
drop table if exists chat_person;
drop table if exists message;
drop table if exists chat;
drop table if exists retweet;
drop table if exists liked_tweet;
drop table if exists tweet;
drop table if exists follower;
drop table if exists person;
drop table if exists login;
drop table if exists locality;

drop table if exists locality;
create table locality
(
    id int not null unique,
    name_of_country varchar(20) not null unique,
    primary key (id)
);

drop table if exists login;
create table login
(
    id int not null unique,
    nick_name varchar(20) not null unique,
    email varchar(30) not null unique,
    password varchar(20) not null,
    primary key (id)
);

drop table if exists person;
create table person
(
    id int not null unique,
    login_id int not null unique,
    locality_id int,
    name varchar(20),
    description text,
    date_of_birth date not null,
    date_of_creation date not null,
    count_of_followers int not null,
    count_of_read_users int not null,
    primary key (id),
    foreign key (locality_id) references locality(id),
    foreign key (login_id) references login(id)
);

drop table if exists follower;
create table follower
(
    following_person_id int not null,
    followed_person_id int not null,
    date timestamp not null default current_timestamp,
    primary key (following_person_id, followed_person_id),
    foreign key (following_person_id) references person(id),
    foreign key (followed_person_id) references person(id)
);

drop table if exists tweet;
create table tweet
(
    id int not null unique,
    person_id int not null,
    answer_tweet_id int,
    content text,
    date_of_creation timestamp not null default current_timestamp,
    count_of_comments int not null,
    count_of_retweets int not null,
    count_of_likes int not null,
    primary key (id),
    foreign key (person_id) references person(id),
    foreign key (answer_tweet_id) references tweet(id)
);

drop table if exists retweet;
create table retweet
(
    person_id int not null,
    tweet_id int not null,
    date_of_retweet timestamp not null default current_timestamp,
    primary key (person_id, tweet_id),
    foreign key (person_id) references person(id),
    foreign key (tweet_id) references tweet(id)
);

drop table if exists liked_tweet;
create table liked_tweet
(
    person_id int not null,
    tweet_id int not null,
    date_of_like timestamp not null default current_timestamp,
    primary key (person_id, tweet_id),
    foreign key (person_id) references person(id),
    foreign key (tweet_id) references tweet(id)
);

drop table if exists chat;
create table chat
(
    id int not null unique,
    name_of_chat varchar(20),
    date_of_creation timestamp not null default current_timestamp,
    primary key (id)
);

drop table if exists chat_person;
create table chat_person
(
    person_id int not null,
    chat_id int not null,
    primary key (person_id, chat_id),
    foreign key (person_id) references person(id),
    foreign key (chat_id) references chat(id)
);

drop table if exists message;
create table message
(
    id int not null unique,
    chat_id int not null,
    person_id int not null,
    content text,
    date_of_creation timestamp not null default current_timestamp,
    primary key (id),
    foreign key (person_id) references person(id),
    foreign key (chat_id) references chat(id)
);


drop table if exists shared_tweet;
create table shared_tweet
(
    chat_id int not null,
    person_id int not null,
    tweet_id int not null,
    date_of_sharing timestamp not null default current_timestamp,
    primary key (tweet_id, person_id, chat_id),
    foreign key (tweet_id) references tweet(id),
    foreign key (person_id) references person(id),
    foreign key (chat_id) references chat(id)
);


insert into locality(id, name_of_country) values (1, 'Norway');
insert into locality(id, name_of_country) values (2, 'USA');
insert into locality(id, name_of_country) values (3, 'England');
insert into locality(id, name_of_country) values (4, 'Australia');
insert into locality(id, name_of_country) values (5, 'Canada');
insert into locality(id, name_of_country) values (6, 'France');
insert into locality(id, name_of_country) values (7, 'Mexico');
insert into locality(id, name_of_country) values (8, 'Switzerland');
insert into locality(id, name_of_country) values (9, 'Japan');
insert into locality(id, name_of_country) values (10, 'South Korea');

insert into login(id, nick_name, email, password) values (1, '@AURORAmusic', 'aurora@gmail.com', 'ajfnajkndflndf');
insert into login(id, nick_name, email, password) values (2, '@tylerrjoseph', 'tylerjoseph@gmail.com', 'asd23rf3');
insert into login(id, nick_name, email, password) values (3, '@Harry_Styles', 'harrystyles@gmail.com', '324niesd');
insert into login(id, nick_name, email, password) values (4, '@MelanieLBBH', 'melaniemartinez@gmail.com', 'aeowdnNSNJ0');
insert into login(id, nick_name, email, password) values (5, '@Grimezsz', 'claireeliseboucher@gmail.com', 'aJSJncsSdflndf');
insert into login(id, nick_name, email, password) values (6, '@Sia', 'kateisobellefurler@gmail.com', 'a33ednskr');
insert into login(id, nick_name, email, password) values (7, '@thenbhd', 'theneighbourhood@gmail.com', 'aJSNs024Jf');
insert into login(id, nick_name, email, password) values (8, '@_IUofficial', 'iu@gmail.com', 'dushf832H');


insert into person(id, login_id, locality_id, name, description, date_of_birth, date_of_creation, count_of_followers, count_of_read_users)
values (1, 1, 1, 'AURORA', '…The Gods We Can Touch….. ……………..⚔️🩸⚔️…………….', '1996-05-15', '2013-04-01', 2541000, 387);
insert into person(id, login_id, locality_id, name, description, date_of_birth, date_of_creation, count_of_followers, count_of_read_users)
values (2, 2, 2, 'tyler jøseph', '|-/ @twentyonepilots.', '1988-12-01', '2010-10-01', 2100000, 99);
insert into person(id, login_id, locality_id, name, description, date_of_birth, date_of_creation, count_of_followers, count_of_read_users)
values (3, 3, 3, 'Harry Styles.', '', '1994-02-01', '2010-08-01', 38300000, 1806);
insert into person(id, login_id, locality_id, name, description, date_of_birth, date_of_creation, count_of_followers, count_of_read_users)
values (4, 4, 2, 'Cry Baby', '𓇗 𝔱𝔥𝔢 𝔬𝔫𝔢 𝔞𝔫𝔡 𝔬𝔫𝔩𝔶 , 𝔩𝔦𝔳𝔦𝔫𝔤 𝔡𝔢𝔠𝔢𝔞𝔰𝔢𝔡 𓋼 🕳️', '1995-04-28', '2012-07-01', 1300000, 0);
insert into person(id, login_id, locality_id, name, description, date_of_birth, date_of_creation, count_of_followers, count_of_read_users)
values (5, 5, 5, '𝔊𝔯𝔦𝔪𝔢𝔰', 'our lady of perpetual chaos.  Apprentice Planetologist at @makesoil 🧚🏻‍♀️ Lore for Modern Magic 🪐', '1988-03-17', '2011-04-01', 1300000, 1669);
insert into person(id, login_id, locality_id, name, description, date_of_birth, date_of_creation, count_of_followers, count_of_read_users)
values (6, 6, 4, 'sia', 'Official Sia Twitter Account run by Team Sia', '1975-12-18', '2009-03-01', 3600000, 350);
insert into person(id, login_id, locality_id, name, description, date_of_birth, date_of_creation, count_of_followers, count_of_read_users)
values (7, 7, 2, 'The Neighbourhood', 'http://thenbhd.com/store', '2011-01-01', '2011-08-01', 1000000, 0);
insert into person(id, login_id, locality_id, name, description, date_of_birth, date_of_creation, count_of_followers, count_of_read_users)
values (8, 8, 10,'아이유(IU) 공식 트위터', '아이유(IU) Official Twitter','1993-05-16', '2018-08-01', 1500000, 1);

insert into follower (following_person_id, followed_person_id) values (1, 3);
insert into follower (following_person_id, followed_person_id) values (1, 7);
insert into follower (following_person_id, followed_person_id) values (1, 5);
insert into follower (following_person_id, followed_person_id) values (2, 3);
insert into follower (following_person_id, followed_person_id) values (2, 7);
insert into follower (following_person_id, followed_person_id) values (3, 2);
insert into follower (following_person_id, followed_person_id) values (3, 5);
insert into follower (following_person_id, followed_person_id) values (4, 5);
insert into follower (following_person_id, followed_person_id) values (4, 7);
insert into follower (following_person_id, followed_person_id) values (5, 4);
insert into follower (following_person_id, followed_person_id) values (5, 7);
insert into follower (following_person_id, followed_person_id) values (6, 7);
insert into follower (following_person_id, followed_person_id) values (6, 1);
insert into follower (following_person_id, followed_person_id) values (7, 1);
insert into follower (following_person_id, followed_person_id) values (7, 2);

insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (1, 1,'Hello Norway, I’m playing at Portor Pensjonat on 9th July! ❤️',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (2, 1,'Can’t wait to be at Foynhagen in July! 🎭',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (3, 2,'our album, vessel, is 10 years old today. live variety stream to celebrate. 3p est. |-/',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (4, 2,'happy birthday to everyone, ever',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (5, 3,'Harry’s House. Out now.',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (6, 3,'Love On Tour. Curitiba. December, 2022.',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (7, 4,'“𝖕𝖔𝖗𝖙𝖆𝖑𝖘” 𝖙𝖍𝖊 𝖆𝖑𝖇𝖚𝖒 𝖈𝖔𝖒𝖊𝖘 𝖔𝖚𝖙 3/31 𓇗 𓆇𝖕𝖗𝖊-𝖔𝖗𝖉𝖊𝖗 𝖓𝖔𝖜 𓍊𓆑 & 𝔟𝔢 𝔱𝔥𝔢 𝔣𝔦𝔯𝔰𝔱 𝔱𝔬 𝔰𝔢𝔢 𝔱𝔥𝔢 𝔞𝔩𝔟𝔲𝔪 𝔠𝔬𝔳𝔢𝔯…',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (8, 4,'stored in our core.
felt over and over again.
we’ve been here before.
in different vessels, on different planets.
playing different roles.
evolving and learning from one another.
the synchronicities we witness,
we’ve planned them together.',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (9, 5,'Marie Antoinette after the singularity',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (10, 5,'For my birthday I`d like to make a Faustian bargain with a demon if anyone can organize this for me plz',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (11, 6,'dear @tovelo I’ve always wanted to tell you I wish I’d written heroes, I would love to collaborate with you too! Thank you for the love!!',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (12, 6,'Happy New Year! 🎊 - Team Sia',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (13, 7,'🪄 CHIP CHROME & THE MONO-TONES DELUXE✨ out now. We added 4 new tracks to complete the story: Stargazing, Over the Influence, Here We Go Again & The Shining. Thank you for all the spins you''ve been givin this record so far. Stay tuned! 📡 https://thenbhd.lnk.to/cctmtd',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (14, 7,'We are grateful to Maria for coming forward. We have zero tolerance for any kind of inappropriate behavior towards women. As a result of Brandon’s actions, he will no longer be a member of The Neighbourhood.',0,0,0);
insert into tweet(id, person_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (15, 1,'Konnichiwa Japan! Watashiwa Aurora desu.
I cannot wait to come to Japan again, and I hope you enjoy my special album for my Japanese fans! 🫀
Aishitemasu!',0,0,0);
insert into tweet(id, person_id, answer_tweet_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (16, 1, 5,'Amazing, i like it!',0,0,10);
insert into tweet(id, person_id, answer_tweet_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (17, 2, 5,'Not bad!',0,0,20);
insert into tweet(id, person_id, answer_tweet_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (18, 3, 5,'Such a good album!',0,0,340);
insert into tweet(id, person_id, answer_tweet_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (19, 4, 5,'super!',0,0,100);
insert into tweet(id, person_id, answer_tweet_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (20, 5, 5,'Good work!',0,0,1000);

insert into chat(id) values (1);
insert into chat(id) values (2);
insert into chat(id) values (3);
insert into chat(id) values (4);
insert into chat(id) values (5);
insert into chat(id) values (6);
insert into chat(id) values (7);
insert into chat(id) values (8);
insert into chat(id) values (9);
insert into chat(id) values (10);
insert into chat(id) values (11);
insert into chat(id) values (12);
insert into chat(id) values (13);
insert into chat(id) values (14);
insert into chat(id) values (15);
insert into chat(id) values (16);
insert into chat(id, name_of_chat) values (17, 'TheBestSingersEver');
insert into chat(id, name_of_chat) values (18, 'COACHELLA 2023');
insert into chat(id, name_of_chat) values (19, 'idk');

insert into chat_person(person_id, chat_id) values (1,1);
insert into chat_person(person_id, chat_id) values (2,1);
insert into chat_person(person_id, chat_id) values (1,2);
insert into chat_person(person_id, chat_id) values (3,2);
insert into chat_person(person_id, chat_id) values (1,3);
insert into chat_person(person_id, chat_id) values (7,3);
insert into chat_person(person_id, chat_id) values (1,4);
insert into chat_person(person_id, chat_id) values (4,4);
insert into chat_person(person_id, chat_id) values (1,5);
insert into chat_person(person_id, chat_id) values (6,5);
insert into chat_person(person_id, chat_id) values (2,6);
insert into chat_person(person_id, chat_id) values (5,6);
insert into chat_person(person_id, chat_id) values (2,7);
insert into chat_person(person_id, chat_id) values (7,7);
insert into chat_person(person_id, chat_id) values (2,8);
insert into chat_person(person_id, chat_id) values (4,8);
insert into chat_person(person_id, chat_id) values (3,9);
insert into chat_person(person_id, chat_id) values (5,9);
insert into chat_person(person_id, chat_id) values (3,10);
insert into chat_person(person_id, chat_id) values (7,10);
insert into chat_person(person_id, chat_id) values (4,11);
insert into chat_person(person_id, chat_id) values (5,11);
insert into chat_person(person_id, chat_id) values (4,12);
insert into chat_person(person_id, chat_id) values (7,12);
insert into chat_person(person_id, chat_id) values (5,13);
insert into chat_person(person_id, chat_id) values (6,13);
insert into chat_person(person_id, chat_id) values (1,14);
insert into chat_person(person_id, chat_id) values (5,14);
insert into chat_person(person_id, chat_id) values (5,15);
insert into chat_person(person_id, chat_id) values (7,15);
insert into chat_person(person_id, chat_id) values (6,16);
insert into chat_person(person_id, chat_id) values (7,16);

insert into chat_person(person_id, chat_id) values (1,17);
insert into chat_person(person_id, chat_id) values (2,17);
insert into chat_person(person_id, chat_id) values (4,17);
insert into chat_person(person_id, chat_id) values (7,17);

insert into chat_person(person_id, chat_id) values (6,18);
insert into chat_person(person_id, chat_id) values (5,18);
insert into chat_person(person_id, chat_id) values (3,18);
insert into chat_person(person_id, chat_id) values (7,18);

insert into chat_person(person_id, chat_id) values (1,19);
insert into chat_person(person_id, chat_id) values (2,19);
insert into chat_person(person_id, chat_id) values (3,19);
insert into chat_person(person_id, chat_id) values (4,19);

insert into shared_tweet (chat_id, person_id, tweet_id) values (1, 1, 6);
insert into shared_tweet (chat_id, person_id, tweet_id) values (2, 3, 12);
insert into shared_tweet (chat_id, person_id, tweet_id) values (5, 6, 14);
insert into shared_tweet (chat_id, person_id, tweet_id) values (18, 5, 9);
insert into shared_tweet (chat_id, person_id, tweet_id) values (19, 3, 1);

insert into liked_tweet(person_id, tweet_id) values (1, 1);
insert into liked_tweet(person_id, tweet_id) values (1, 6);
insert into liked_tweet(person_id, tweet_id) values (1, 7);
insert into liked_tweet(person_id, tweet_id) values (1, 10);
insert into liked_tweet(person_id, tweet_id) values (2, 1);
insert into liked_tweet(person_id, tweet_id) values (3, 1);
insert into liked_tweet(person_id, tweet_id) values (4, 2);
insert into liked_tweet(person_id, tweet_id) values (5, 2);
insert into liked_tweet(person_id, tweet_id) values (7, 2);
insert into liked_tweet(person_id, tweet_id) values (5, 3);
insert into liked_tweet(person_id, tweet_id) values (7, 3);
insert into liked_tweet(person_id, tweet_id) values (3, 4);
insert into liked_tweet(person_id, tweet_id) values (1, 5);
insert into liked_tweet(person_id, tweet_id) values (2, 6);
insert into liked_tweet(person_id, tweet_id) values (3, 6);
insert into liked_tweet(person_id, tweet_id) values (4, 7);
insert into liked_tweet(person_id, tweet_id) values (5, 7);
insert into liked_tweet(person_id, tweet_id) values (6, 8);
insert into liked_tweet(person_id, tweet_id) values (7, 9);
insert into liked_tweet(person_id, tweet_id) values (6, 10);
insert into liked_tweet(person_id, tweet_id) values (7, 11);
insert into liked_tweet(person_id, tweet_id) values (3, 12);
insert into liked_tweet(person_id, tweet_id) values (3, 13);
insert into liked_tweet(person_id, tweet_id) values (2, 14);
insert into liked_tweet(person_id, tweet_id) values (1, 14);

insert into retweet(person_id, tweet_id) values (1,14);
insert into retweet(person_id, tweet_id) values (1,12);
insert into retweet(person_id, tweet_id) values (2,12);
insert into retweet(person_id, tweet_id) values (3,2);
insert into retweet(person_id, tweet_id) values (5,5);
insert into retweet(person_id, tweet_id) values (7,4);

insert into message(id, chat_id, person_id, content) values (1, 1, 1, 'Hi, Tyler, how are you?');
insert into message(id, chat_id, person_id, content) values (2, 1, 1, 'I have a new album? Did you see it???');
insert into message(id, chat_id, person_id, content) values (3, 1, 2, 'oh, hello, i`m fine, and you?');
insert into message(id, chat_id, person_id, content) values (4, 1, 2, 'your album is crazy, i like it');
insert into message(id, chat_id, person_id, content) values (5, 1, 1, 'AAaAAAaa thank you <3 <3 <3');
insert into message(id, chat_id, person_id, content) values (6, 1, 1, 'When do you have your concert? On 25 december?');
insert into message(id, chat_id, person_id, content) values (7, 1, 2, 'oooh, i do not know yet');
insert into message(id, chat_id, person_id, content) values (8, 1, 2, 'i think it will be later, because now i am working on my new song!');
insert into message(id, chat_id, person_id, content) values (9, 1, 1, 'It`s impressive :0');

insert into message(id, chat_id, person_id, content) values (10, 2, 1, 'hello');
insert into message(id, chat_id, person_id, content) values (11, 2, 3, 'hi');
insert into message(id, chat_id, person_id, content) values (12, 2, 1, 'bye :(');

insert into message(id, chat_id, person_id, content) values (13, 3, 7, 'good day, would you do with me a joint concert?1');
insert into message(id, chat_id, person_id, content) values (14, 3, 1, 'Yes, why not!!!');
insert into message(id, chat_id, person_id, content) values (15, 3, 7, 'okay, call me!');

insert into message(id, chat_id, person_id, content) values (16, 4, 1, 'hello');
insert into message(id, chat_id, person_id, content) values (17, 4, 4, 'hello');
insert into message(id, chat_id, person_id, content) values (18, 4, 1, 'why do you copy me?');

insert into message(id, chat_id, person_id, content) values (19, 5, 6, 'hello');
insert into message(id, chat_id, person_id, content) values (20, 5, 6, 'where are you?');
insert into message(id, chat_id, person_id, content) values (21, 5, 1, 'I am in England');

insert into message(id, chat_id, person_id, content) values (22, 6, 2, 'hey');
insert into message(id, chat_id, person_id, content) values (23, 6, 5, 'hello');
insert into message(id, chat_id, person_id, content) values (24, 6, 5, 'hellooooo');

insert into message(id, chat_id, person_id, content) values (25, 7, 7, 'hello');
insert into message(id, chat_id, person_id, content) values (26, 7, 7, 'privet');
insert into message(id, chat_id, person_id, content) values (27, 7, 2, 'what is privet?');

insert into message(id, chat_id, person_id, content) values (28, 8, 2, 'hello');
insert into message(id, chat_id, person_id, content) values (29, 8, 4, 'hello, what is new?');
insert into message(id, chat_id, person_id, content) values (30, 8, 4, 'how its going?');

insert into message(id, chat_id, person_id, content) values (31, 9, 3, 'hello');
insert into message(id, chat_id, person_id, content) values (32, 9, 5, 'goodbye');
insert into message(id, chat_id, person_id, content) values (33, 9, 3, ':(((');

insert into message(id, chat_id, person_id, content) values (34, 10, 3, 'hello');
insert into message(id, chat_id, person_id, content) values (35, 10, 7, 'hi :3');
insert into message(id, chat_id, person_id, content) values (36, 10, 7, 'what are you doing?');

insert into message(id, chat_id, person_id, content) values (37, 11, 4, 'hello');
insert into message(id, chat_id, person_id, content) values (38, 11, 5, 'uwu hello');
insert into message(id, chat_id, person_id, content) values (39, 11, 4, 'Are you going on COACHELLA?');

insert into message(id, chat_id, person_id, content) values (40, 12, 4, 'hey');
insert into message(id, chat_id, person_id, content) values (41, 12, 7, 'hello');
insert into message(id, chat_id, person_id, content) values (42, 12, 4, 'what did you eat today?');

insert into message(id, chat_id, person_id, content) values (43, 13, 5, 'hey!');

insert into message(id, chat_id, person_id, content) values (44, 14, 5, 'hello, do you go on COACHELLA?');

insert into message(id, chat_id, person_id, content) values (45, 15, 7, 'hello!');
insert into message(id, chat_id, person_id, content) values (46, 15, 7, 'pls, do not ignore me');

insert into message(id, chat_id, person_id, content) values (47, 16, 6, 'hello!');
insert into message(id, chat_id, person_id, content) values (48, 16, 6, 'what did you want?');

insert into message(id, chat_id, person_id, content) values (49, 17, 1, 'hello everyone');
insert into message(id, chat_id, person_id, content) values (50, 17, 1, 'look at this');
insert into shared_tweet(chat_id, person_id, tweet_id) values (17, 1, 5);
insert into message(id, chat_id, person_id, content) values (51, 17, 4, 'lmao');
insert into message(id, chat_id, person_id, content) values (52, 17, 2, 'haha');
insert into message(id, chat_id, person_id, content) values (53, 17, 4, 'wow');
insert into message(id, chat_id, person_id, content) values (54, 17, 7, 'that`s cool');
insert into message(id, chat_id, person_id, content) values (55, 17, 7, 'it is impossible');
insert into message(id, chat_id, person_id, content) values (56, 17, 2, 'how are you, guys?');
insert into message(id, chat_id, person_id, content) values (57, 17, 4, 'i am ok');

insert into message(id, chat_id, person_id, content) values (58, 18, 6, 'hello');
insert into message(id, chat_id, person_id, content) values (59, 18, 5, 'hiii');
insert into message(id, chat_id, person_id, content) values (60, 18, 3, 'hi');

insert into message(id, chat_id, person_id, content) values (61, 19, 1, 'hello guys');
insert into message(id, chat_id, person_id, content) values (62, 19, 2, 'hello');
insert into message(id, chat_id, person_id, content) values (63, 19, 2, 'how its going');
insert into message(id, chat_id, person_id, content) values (64, 19, 3, 'hey, i have a new song!!!');
insert into message(id, chat_id, person_id, content) values (65, 19, 4, 'aaaa, i am in love with this song!');

-- the first person's chats
create view auroras_chats as
select person_id, chat_id
from chat_person
where person_id = 1
order by chat_id desc;

-- the first person's liked tweets
create view auroras_liked_tweets as
select person_id, tweet_id , date_of_like
from liked_tweet
where person_id = 1
order by date_of_like desc ;

-- messages and shared tweets in 17th chat
create view all_content_from_17th_chat as
select m.person_id, m.chat_id, m.content, m.date_of_creation, 'message'
from message m
where chat_id = 17
union
select st.tweet_id, st.chat_id, t.content,st.date_of_sharing, 'shared post'
from shared_tweet as st
inner join tweet as t on t.id = st.tweet_id
where st.chat_id = 17
order by date_of_creation;

-- tweets and retweets of the first person
create view auroras_main_page as
select person_id, id, date_of_creation from tweet where tweet.person_id = 1
union
select person_id, tweet_id, date_of_retweet from retweet where retweet.person_id = 1
order by date_of_creation desc;

-- login, locality and person's information
create view login_locality_persons_information as
select login.*, p.name, p.description, p.date_of_birth, p.date_of_creation, p.count_of_followers, p.count_of_read_users, l.name_of_country
from login
natural join person p
inner join locality l on p.locality_id = l.id
order by login_id desc;

-- statistic of users in different countries
create view all_countries_by_users as
select name_of_country, p.* from locality
left join person p
on locality.id = p.locality_id
order by name_of_country desc ;

-- count of written messages of every person
create view count_of_written_messages as
select person_id, name, count(m.id)
from message m, person where person_id= person.id
group by person_id, name
order by count(m.id);

-- count of persons in countries
create view statistic_users_in_different_countries as
select locality_id, name_of_country, count(name)
from person
cross join locality l where locality_id = l.id
group by locality_id, name_of_country
order by count(name) desc ;

-- count of likes on tweet
create view statistic_of_likes as
select p.name, sum(t.count_of_likes)
from person p
cross join tweet t where t.person_id = p.id
group by name
order by sum(t.count_of_likes) desc;

-- all comments of 5th tweet
create view comment_of_5th_tweet as
select person_id, answer_tweet_id, content, count_of_likes, date_of_creation
from tweet
where answer_tweet_id = 5
union
select person_id, answer_tweet_id, content, count_of_likes, date_of_creation
from tweet
where  id = 5
order by date_of_creation
;


-- show average count of likes
create view average_count_of_likes as
select p.name, avg(t.count_of_likes)
from person p
cross join tweet t where t.person_id = p.id
group by name
order by avg(t.count_of_likes) desc;

-- show 5 the most popular tweet
create view five_the_most_popular_tweets as
select *
from tweet
where id in (
    select tweet_id
    from liked_tweet
    group by tweet_id
    order by count(*) desc
    limit 5
);

-- show people from USA
create view people_from_USA as
select *
from person p
where  p.locality_id = (
    select l.id
    from locality l
    where l.name_of_country = 'USA'
);

-- autoincrementation
drop sequence tweet_sequence;
create sequence tweet_sequence
start 21
increment 1;

drop function set_sequence_id() cascade;
create or replace function set_sequence_id()
   returns trigger
   language plpgsql
as $$
begin
   NEW.id = nextval('tweet_sequence');
    return NEW;
end
$$;

create or replace trigger auto_id_tweet
   before insert
   on tweet
   for each row
       execute procedure set_sequence_id();

insert into tweet(person_id, answer_tweet_id, content, count_of_comments, count_of_retweets, count_of_likes)
values (5, 1,'wow',0,0,1000);

select *
from tweet;

----skript na aspoň dva zmysluplné triggre (okrem triggerov na autoinkrementáciu)
-- check valid email with adding a new login
drop function valid_email() cascade;
create or replace function valid_email()
   returns trigger
   language plpgsql
as $$
begin
   if new.email not like('%@gmail.com') then
        raise exception 'Invalid email format!';
    end if;
    return NEW;
end
$$;

create or replace trigger check_email
   before insert
   on login
   for each row
       execute procedure valid_email();


insert into login(id, nick_name, email, password) values (9, 'valerii', 'lol@tuke.sk', 'ssaf');
insert into login(id, nick_name, email, password) values (9, 'valerii', 'lol@gmail.com', 'ssaf');
delete from login where id = 9;

-- edit message with current id
create view chat_messages as
    select p.name, m.content, m.id
    from message m, person p
    where m.person_id = p.id;

drop function edit_message() cascade;
create or replace function edit_message()
   returns trigger
   language PLPGSQL
as $$
begin
    update message set content = NEW.content where id = NEW.id;
    return NEW;
end
$$;

create or replace trigger editing_of_message
   instead of update
   on chat_messages
   for each row
       execute procedure edit_message();

update chat_messages set content = 'EDITED MESSAGE' where id = 1;

-- procedure ( write a tweet )
create or replace procedure write_tweet(in this_content text, in this_nick_name varchar(20))
as $$
begin
    insert into tweet(person_id, content, count_of_comments, count_of_retweets, count_of_likes)
    values ((select id from person p where p.login_id = (select l.id from login l where l.nick_name = this_nick_name )),
            this_content, 0, 0, 0);
end;
$$
language plpgsql;

call write_tweet('i wrote 2nd tweet','@tylerrjoseph');

-- function ( show all chats the person with current nick name has )
create or replace function my_chats(in this_nick_name varchar(20))
returns table (
     chat_name varchar(30)
)
as $$
begin
    return query select case when c.name_of_chat is null then p2.name else c.name_of_chat end as result_name
                    from chat c
                    inner join chat_person cp1 on c.id = cp1.chat_id
                    inner join person p1 on cp1.person_id = p1.id
                    inner join login l on l.id = p1.login_id

                    inner join chat_person cp2 on c.id = cp2.chat_id
                    inner join person p2 on cp2.person_id = p2.id
                    where l.nick_name = this_nick_name and p1.name != p2.name
                    group by result_name;
end;
$$
language plpgsql;

select my_chats('@tylerrjoseph');

