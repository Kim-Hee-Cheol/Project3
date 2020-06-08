-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- suamil_db 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `suamil_db`;
CREATE DATABASE IF NOT EXISTS `suamil_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `suamil_db`;

-- 테이블 suamil_db.membership 구조 내보내기
DROP TABLE IF EXISTS `membership`;
CREATE TABLE IF NOT EXISTS `membership` (
  `name` varchar(30) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `user_pw` varchar(30) NOT NULL,
  `user_pw2` varchar(30) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `grade` varchar(20) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 suamil_db.membership:~3 rows (대략적) 내보내기
DELETE FROM `membership`;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` (`name`, `user_id`, `user_pw`, `user_pw2`, `tel`, `mobile`, `email`, `address`, `grade`) VALUES
	('안녕', 'asdf@@1', 'a1!!a1!!', 'a1!!a1!!', '010-0-13', '13-1318-313', '1sdf@hanmail.net', '06267서울 강남구 강남대로 238ㄴㅇㄹㄴㄹㅇ (도곡동)', '1'),
	('김희철', 'heechar3934!', 'dongju1425@', 'dongju1425@', '031-207-3930', '010-9018-3934', 'qaz3ws@naver.com', '16325경기 수원시 장안구 정자로42번길 52736동 1603호 (천천동, 비단마을 베스트타운)', '10'),
	('홍길동', 'rlagmlcjf123@', 'rlagmlcjf123@', 'rlagmlcjf123@', '010-9013-5131', '351-131-3131', 'khc90183934@gmail.com', '08505서울 금천구 가산디지털2로 1234층 kosmo (가산동)', '1');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;

-- 테이블 suamil_db.multi_board 구조 내보내기
DROP TABLE IF EXISTS `multi_board`;
CREATE TABLE IF NOT EXISTS `multi_board` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `postdate` datetime DEFAULT current_timestamp(),
  `visitcount` mediumint(9) NOT NULL DEFAULT 0,
  `bname` varchar(30) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `fk_board_member` (`user_id`),
  CONSTRAINT `fk_board_member` FOREIGN KEY (`user_id`) REFERENCES `membership` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 테이블 데이터 suamil_db.multi_board:~10 rows (대략적) 내보내기
DELETE FROM `multi_board`;
/*!40000 ALTER TABLE `multi_board` DISABLE KEYS */;
INSERT INTO `multi_board` (`num`, `title`, `content`, `user_id`, `postdate`, `visitcount`, `bname`) VALUES
	(2, 'test', 'test5', 'heechar3934!', '2020-06-05 10:12:13', 2, 'freeboard'),
	(3, 'test2', 'test2', 'heechar3934!', '2020-06-05 10:14:21', 11, 'freeboard'),
	(5, '공지사항입니다.', '공지내용입니다.', 'heechar3934!', '2020-06-05 14:42:59', 6, 'notice'),
	(6, '안녕', '안녕', 'rlagmlcjf123@', '2020-06-05 14:44:07', 2, 'freeboard'),
	(7, '제목입니다', '내용입니다', 'rlagmlcjf123@', '2020-06-05 14:50:02', 0, 'freeboard'),
	(8, '제목입니다', '내용입니다', 'heechar3934!', '2020-06-05 14:52:27', 0, 'freeboard'),
	(9, '여긴 공지사항', '내용있음', 'heechar3934!', '2020-06-05 14:54:02', 4, 'freeboard'),
	(11, '안녕', '안녕', 'heechar3934!', '2020-06-05 15:56:56', 2, 'information'),
	(12, '안녕', 'ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹ', 'heechar3934!', '2020-06-05 16:35:24', 2, 'freeboard'),
	(13, 'sdaf', 'asdf', 'heechar3934!', '2020-06-05 17:03:58', 0, 'information');
/*!40000 ALTER TABLE `multi_board` ENABLE KEYS */;

-- 테이블 suamil_db.myfile 구조 내보내기
DROP TABLE IF EXISTS `myfile`;
CREATE TABLE IF NOT EXISTS `myfile` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `sfile` varchar(100) NOT NULL,
  `ofile` varchar(100) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 suamil_db.myfile:~0 rows (대략적) 내보내기
DELETE FROM `myfile`;
/*!40000 ALTER TABLE `myfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `myfile` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
