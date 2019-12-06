#### 1. 사용자 생성 및 권한 주기 및 DB 생성
- create user 'blogcrud'@'localhost' identified by 'bitc5600';
- GRANT ALL PRIVILEGES ON *.* TO 'blogcrud'@'localhost';
- create database blogcrud;
- use blogcrud;

#### 2. 테이블
```sql
CREATE TABLE user(
    id int auto_increment primary key,
    username varchar(20) not null unique,
    password varchar(30) not null,
    email varchar(100) not null,
    userProfile varchar(300) default 'images/userprofile/userProfile.png',
    createDate timestamp
) engine=InnoDB default charset=utf8;
```

```sql
CREATE TABLE board(
    id int auto_increment primary key,
    userId int,
    title varchar(100) not null,
    content longtext,
    readCount int default 0,
    createDate timestamp,
    foreign key (userId) references user (id)
) engine=InnoDB default charset=utf8;
```