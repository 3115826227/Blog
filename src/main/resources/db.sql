DROP DATABASE IF EXISTS blog;
/*�������ݿ⣬�����ñ���*/
CREATE DATABASE blog DEFAULT CHARACTER SET utf8;

USE blog;

CREATE TABLE `t_blogger` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `username` VARCHAR(50) NOT NULL COMMENT '��������',
  `password` VARCHAR(100) NOT NULL COMMENT '��������',
  `profile` TEXT COMMENT '������Ϣ',
  `nickname` VARCHAR(50) DEFAULT NULL COMMENT '�����ǳ�',
  `sign` VARCHAR(100) DEFAULT NULL COMMENT '����ǩ��',
  `imagename` VARCHAR(100) DEFAULT NULL COMMENT '����ͷ��·��',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `t_link` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '�������ӱ�id',
  `linkname` VARCHAR(100) DEFAULT NULL COMMENT '����������',
  `linkurl` VARCHAR(200) DEFAULT NULL COMMENT '��������url',
  `orderNum` INT(11) DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `t_blogtype` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `typeName` VARCHAR(30) DEFAULT NULL COMMENT '�������',
  `orderNum` INT(11) DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

CREATE TABLE `t_blog` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '��������',
  `title` VARCHAR(200) NOT NULL COMMENT '������Ŀ',
  `summary` VARCHAR(400) DEFAULT NULL COMMENT '����ժҪ',
  `releaseDate` DATETIME DEFAULT NULL COMMENT '��������',
  `clickHit` INT(11) DEFAULT NULL COMMENT '���۴���',
  `replyHit` INT(11) DEFAULT NULL COMMENT '�ظ�����',
  `content` TEXT COMMENT '��������',
  `keyWord` VARCHAR(200) DEFAULT NULL COMMENT '�ؼ���',
  `type_id` INT(11) DEFAULT NULL COMMENT '��������������',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `t_blog_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `t_blogtype` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

CREATE TABLE `t_comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '���۱�id',
  `userIp` VARCHAR(50) DEFAULT NULL COMMENT '�����ߵ�ip',
  `content` VARCHAR(1000) DEFAULT NULL COMMENT '��������',
  `commentDate` DATETIME DEFAULT NULL COMMENT '��������',
  `state` INT(11) DEFAULT NULL COMMENT '���״̬',
  `blog_id` INT(11) DEFAULT NULL COMMENT '����������岩��',
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



INSERT INTO `blogm`.`t_blogtype` (`id`, `typeName`, `orderNum`) VALUES ('1', 'Java', '1');
INSERT INTO `blogm`.`t_blogtype` (`id`, `typeName`, `orderNum`) VALUES ('16', 'MyBatis', '2');
INSERT INTO `blogm`.`t_blogtype` (`id`, `typeName`, `orderNum`) VALUES ('17', 'SpringMVC', '3');
INSERT INTO `blogm`.`t_blogtype` (`id`, `typeName`, `orderNum`) VALUES ('18', 'Spring', '34');
INSERT INTO `blogm`.`t_blogtype` (`id`, `typeName`, `orderNum`) VALUES ('19', 'JVM', '6');

INSERT INTO `blogm`.`t_blog` (`id`, `title`, `summary`, `releaseDate`, `clickHit`, `replyHit`, `content`, `keyWord`, `type_id`) VALUES ('37', '����3', '���Բ��Բ���11', '2018-02-19 15:03:18', '0', '0', '<p>���Բ��Բ���11</p>', '����', '1');
INSERT INTO `blogm`.`t_blog` (`id`, `title`, `summary`, `releaseDate`, `clickHit`, `replyHit`, `content`, `keyWord`, `type_id`) VALUES ('38', '����4', '���Բ��Բ���', '2018-02-19 15:03:30', '0', '0', '<p>���Բ��Բ���</p>', '��', '1');
INSERT INTO `blogm`.`t_blog` (`id`, `title`, `summary`, `releaseDate`, `clickHit`, `replyHit`, `content`, `keyWord`, `type_id`) VALUES ('39', '���Բ��Բ��Բ���', '2222', '2018-02-19 15:03:42', '0', '0', '<p>2222</p>', '1', '1');
INSERT INTO `blogm`.`t_blog` (`id`, `title`, `summary`, `releaseDate`, `clickHit`, `replyHit`, `content`, `keyWord`, `type_id`) VALUES ('40', '����455', '���԰�', '2018-02-19 15:03:59', '0', '0', '<p>���԰�<br/></p>', '����', '1');
INSERT INTO `blogm`.`t_blog` (`id`, `title`, `summary`, `releaseDate`, `clickHit`, `replyHit`, `content`, `keyWord`, `type_id`) VALUES ('41', 'ˮˮ', '���ε�', '2018-02-19 15:04:55', '4', '1', '<p>���ε�</p>', '12', '1');
INSERT INTO `blogm`.`t_blog` (`id`, `title`, `summary`, `releaseDate`, `clickHit`, `replyHit`, `content`, `keyWord`, `type_id`) VALUES ('42', '����mybatis', 'Mybatis����', '2018-02-19 15:21:33', '0', '0', '<p>Mybatis����<img src=\"http://localhost:8080/SSM_blog/static/userImages1/20180219/1519024886626044549.jpg\" title=\"1519024886626044549.jpg\" alt=\"java.jpg\"/></p>', 'mybatis Java', '16');
INSERT INTO `blogm`.`t_blog` (`id`, `title`, `summary`, `releaseDate`, `clickHit`, `replyHit`, `content`, `keyWord`, `type_id`) VALUES ('43', '����SpringMVC', 'SpringMVC���ԣ�', '2018-02-19 15:22:13', '0', '0', '<p>SpringMVC���ԣ�</p>', 'springmvc mybatis', '17');
INSERT INTO `blogm`.`t_blog` (`id`, `title`, `summary`, `releaseDate`, `clickHit`, `replyHit`, `content`, `keyWord`, `type_id`) VALUES ('44', '����Spring', '����Spring', '2018-02-19 15:22:45', '0', '0', '<p>����Spring</p>', 'spring', '18');
INSERT INTO `blogm`.`t_blog` (`id`, `title`, `summary`, `releaseDate`, `clickHit`, `replyHit`, `content`, `keyWord`, `type_id`) VALUES ('45', '����JVM', '����JVM', '2018-02-19 15:23:31', '2', '0', '<p>����JVM</p>', 'JVM', '19');
INSERT INTO `blogm`.`t_blog` (`id`, `title`, `summary`, `releaseDate`, `clickHit`, `replyHit`, `content`, `keyWord`, `type_id`) VALUES ('46', '����2', '���Բ���2', '2018-02-19 15:31:10', '1', '0', '<p>���Բ���2<br/></p>', 'Java MyBatis', '17');

INSERT INTO `blogm`.`t_blogger` (`id`, `username`, `password`, `profile`, `nickname`, `sign`, `imagename`) VALUES ('1', 'admin', '123', '<p>û�м�飡</p>', '���', 'û��ǩ��', '20180219025821.jpg');


INSERT INTO `blogm`.`t_comment` (`id`, `userIp`, `content`, `commentDate`, `state`, `blog_id`) VALUES ('3', '0:0:0:0:0:0:0:1', '���۲��ԣ�', '2018-02-19 14:59:51', '1', '37');
INSERT INTO `blogm`.`t_comment` (`id`, `userIp`, `content`, `commentDate`, `state`, `blog_id`) VALUES ('4', '0:0:0:0:0:0:0:1', '1111', '2018-02-19 15:16:28', '1', '41');

INSERT INTO `blogm`.`t_link` (`id`, `linkname`, `linkurl`, `orderNum`) VALUES ('8', 'SpringMvc', NULL, NULL);

