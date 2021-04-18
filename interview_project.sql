-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2021-04-18 03:11:58
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interview_project`
--

DELIMITER $$
--
-- 存储过程
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_article` (IN `poster_id` INT(11), IN `topic` VARCHAR(2000), IN `content` VARCHAR(8000))  begin
    insert into article(poster_id,content,time,topic,agreeNum)
    values(poster_id,content,now(),topic,0);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_collect` (IN `art_id` INT(11), IN `collecter` INT(11))  begin
    insert into collect(art_id,collecter)
    values(art_id,collecter);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_follower` (IN `star` INT(11), IN `fans` INT(11))  begin
    insert into follower(star,fans)
    values(star,fans);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_review` (IN `art_id` INT(11), IN `viewer_id` INT(11), IN `content` VARCHAR(2000))  begin
    insert into review(art_id,viewer_id,content,likeNum,time,timestamp)
    values(art_id,viewer_id,content,0,now(),unix_timestamp(now()));
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `art_id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `content` varchar(8000) NOT NULL,
  `time` datetime NOT NULL,
  `topic` varchar(2000) NOT NULL,
  `job` varchar(200) DEFAULT NULL,
  `loc` varchar(200) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `agreeNum` int(11) NOT NULL,
  `tagGroup` varchar(8000) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`art_id`, `poster_id`, `content`, `time`, `topic`, `job`, `loc`, `company`, `agreeNum`, `tagGroup`) VALUES
(2, 865366186, 'where am i from?', '2021-03-07 23:08:08', 'A sad night', 'JAVA工程师', '上海', '腾讯', 2, ''),
(4, 865366186, 'Mamba Out', '2021-03-07 23:12:45', 'what can I say?', '产品经理', '杭州', '阿里巴巴', 3, ''),
(5, 865366186, '恶趣味请问', '2021-03-08 09:56:46', '克莱登', 'JAVA工程师', '深圳', '百度', 1, ''),
(6, 865366186, '1234', '2021-03-17 09:09:09', '招聘', 'JAVA工程师', '上海', '百度', 1, ''),
(7, 865366186, '求考研二战研友', '2021-04-11 10:20:15', '我想去清华大学交叉信息学院或浙江大学计算机学院读研究生', NULL, NULL, NULL, 1, ''),
(8, 865366186, '请问有没有想要一起玩英雄联盟的?', '2021-04-11 19:17:55', '请问有没有想要一起玩英雄联盟的?我是艾欧尼亚最强王者', NULL, NULL, NULL, 1, ''),
(10, 865366186, '不考虑求生需求，如果说因为喜欢而学习的话。为什么喜欢就要学习呢？<br/><br/>相关问题；努力学习的意义到底在哪里？<br/><br/>--题主2017年1月21日前来补充--<br/>感谢各位答主的解释分析。这个问题真是越思考越常新。人总有怠惰的时候，感到非常皮癣想停下来休息。接触到全新的领域或者自己不擅长的领域的时候，向上攀登的阻力就非常大。“为什么我不能走到这里就停止了呀？”这种思想就会浮出水面。可是无所事事一段时间之后，又会非常的空虚惊慌，感觉自己和世界脱节了。我想，这就是为什么不能停止学习的理由吧。<br/><br/>那么，如何才能减少或者缩短这种倦怠期呢?这可能是题主更想问的问题~<br/><br/>之前的问题 （为什么总能听到「读书无用」？ - 学习 - 知乎）代表了一些看法。还有一种看法就是：赖以谋生的知识可能就那么多，为什么还要学习天文地理生物历史呢？从我个人的角度看，非常赞同好奇心这种说法。而在学校学习就是给你提供了探究你感兴趣的领域的基础知识和方法论。没有这些，谈不上能自己追求兴趣和爱好。所以还是请各位同学珍惜在校时光吧！', '2021-04-12 10:24:32', '人为什么要学习更多知识?', NULL, NULL, NULL, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `browse`
--

CREATE TABLE `browse` (
  `userid` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `collect`
--

CREATE TABLE `collect` (
  `collecter` int(11) NOT NULL,
  `art_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `collect`
--

INSERT INTO `collect` (`collecter`, `art_id`) VALUES
(865366186, 2),
(865366186, 4),
(865366186, 6),
(865366186, 7),
(865366186, 8),
(865366186, 10);

-- --------------------------------------------------------

--
-- 表的结构 `exercise`
--

CREATE TABLE `exercise` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `question` varchar(8000) NOT NULL,
  `ansa` varchar(800) NOT NULL,
  `ansb` varchar(800) NOT NULL,
  `ansc` varchar(800) NOT NULL,
  `ansd` varchar(800) NOT NULL,
  `correct` int(11) NOT NULL,
  `reason` varchar(800) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `exercise`
--

INSERT INTO `exercise` (`id`, `type`, `question`, `ansa`, `ansb`, `ansc`, `ansd`, `correct`, `reason`) VALUES
(730, 1, 'type 1 question 1', 'type 1 question 1 ansa ', 'type 1 question 1 ansb ', 'type 1 question 1 ansc ', 'type 1 question 1 ansd ', 2, 'type 1 question 1 reason '),
(731, 1, 'type 1 question 2', 'type 1 question 2 ansa ', 'type 1 question 2 ansb ', 'type 1 question 2 ansc ', 'type 1 question 2 ansd ', 2, 'type 1 question 2 reason '),
(732, 1, 'type 1 question 3', 'type 1 question 3 ansa ', 'type 1 question 3 ansb ', 'type 1 question 3 ansc ', 'type 1 question 3 ansd ', 2, 'type 1 question 3 reason '),
(733, 1, 'type 1 question 4', 'type 1 question 4 ansa ', 'type 1 question 4 ansb ', 'type 1 question 4 ansc ', 'type 1 question 4 ansd ', 3, 'type 1 question 4 reason '),
(734, 1, 'type 1 question 5', 'type 1 question 5 ansa ', 'type 1 question 5 ansb ', 'type 1 question 5 ansc ', 'type 1 question 5 ansd ', 4, 'type 1 question 5 reason '),
(735, 1, 'type 1 question 6', 'type 1 question 6 ansa ', 'type 1 question 6 ansb ', 'type 1 question 6 ansc ', 'type 1 question 6 ansd ', 3, 'type 1 question 6 reason '),
(736, 1, 'type 1 question 7', 'type 1 question 7 ansa ', 'type 1 question 7 ansb ', 'type 1 question 7 ansc ', 'type 1 question 7 ansd ', 4, 'type 1 question 7 reason '),
(737, 1, 'type 1 question 8', 'type 1 question 8 ansa ', 'type 1 question 8 ansb ', 'type 1 question 8 ansc ', 'type 1 question 8 ansd ', 2, 'type 1 question 8 reason '),
(738, 1, 'type 1 question 9', 'type 1 question 9 ansa ', 'type 1 question 9 ansb ', 'type 1 question 9 ansc ', 'type 1 question 9 ansd ', 4, 'type 1 question 9 reason '),
(739, 2, 'type 2 question 1', 'type 2 question 1 ansa ', 'type 2 question 1 ansb ', 'type 2 question 1 ansc ', 'type 2 question 1 ansd ', 1, 'type 2 question 1 reason '),
(740, 2, 'type 2 question 2', 'type 2 question 2 ansa ', 'type 2 question 2 ansb ', 'type 2 question 2 ansc ', 'type 2 question 2 ansd ', 1, 'type 2 question 2 reason '),
(741, 2, 'type 2 question 3', 'type 2 question 3 ansa ', 'type 2 question 3 ansb ', 'type 2 question 3 ansc ', 'type 2 question 3 ansd ', 3, 'type 2 question 3 reason '),
(742, 2, 'type 2 question 4', 'type 2 question 4 ansa ', 'type 2 question 4 ansb ', 'type 2 question 4 ansc ', 'type 2 question 4 ansd ', 4, 'type 2 question 4 reason '),
(743, 2, 'type 2 question 5', 'type 2 question 5 ansa ', 'type 2 question 5 ansb ', 'type 2 question 5 ansc ', 'type 2 question 5 ansd ', 4, 'type 2 question 5 reason '),
(744, 2, 'type 2 question 6', 'type 2 question 6 ansa ', 'type 2 question 6 ansb ', 'type 2 question 6 ansc ', 'type 2 question 6 ansd ', 1, 'type 2 question 6 reason '),
(745, 2, 'type 2 question 7', 'type 2 question 7 ansa ', 'type 2 question 7 ansb ', 'type 2 question 7 ansc ', 'type 2 question 7 ansd ', 2, 'type 2 question 7 reason '),
(746, 2, 'type 2 question 8', 'type 2 question 8 ansa ', 'type 2 question 8 ansb ', 'type 2 question 8 ansc ', 'type 2 question 8 ansd ', 1, 'type 2 question 8 reason '),
(747, 2, 'type 2 question 9', 'type 2 question 9 ansa ', 'type 2 question 9 ansb ', 'type 2 question 9 ansc ', 'type 2 question 9 ansd ', 4, 'type 2 question 9 reason '),
(748, 3, 'type 3 question 1', 'type 3 question 1 ansa ', 'type 3 question 1 ansb ', 'type 3 question 1 ansc ', 'type 3 question 1 ansd ', 3, 'type 3 question 1 reason '),
(749, 3, 'type 3 question 2', 'type 3 question 2 ansa ', 'type 3 question 2 ansb ', 'type 3 question 2 ansc ', 'type 3 question 2 ansd ', 3, 'type 3 question 2 reason '),
(750, 3, 'type 3 question 3', 'type 3 question 3 ansa ', 'type 3 question 3 ansb ', 'type 3 question 3 ansc ', 'type 3 question 3 ansd ', 3, 'type 3 question 3 reason '),
(751, 3, 'type 3 question 4', 'type 3 question 4 ansa ', 'type 3 question 4 ansb ', 'type 3 question 4 ansc ', 'type 3 question 4 ansd ', 3, 'type 3 question 4 reason '),
(752, 3, 'type 3 question 5', 'type 3 question 5 ansa ', 'type 3 question 5 ansb ', 'type 3 question 5 ansc ', 'type 3 question 5 ansd ', 4, 'type 3 question 5 reason '),
(753, 3, 'type 3 question 6', 'type 3 question 6 ansa ', 'type 3 question 6 ansb ', 'type 3 question 6 ansc ', 'type 3 question 6 ansd ', 4, 'type 3 question 6 reason '),
(754, 3, 'type 3 question 7', 'type 3 question 7 ansa ', 'type 3 question 7 ansb ', 'type 3 question 7 ansc ', 'type 3 question 7 ansd ', 3, 'type 3 question 7 reason '),
(755, 3, 'type 3 question 8', 'type 3 question 8 ansa ', 'type 3 question 8 ansb ', 'type 3 question 8 ansc ', 'type 3 question 8 ansd ', 2, 'type 3 question 8 reason '),
(756, 3, 'type 3 question 9', 'type 3 question 9 ansa ', 'type 3 question 9 ansb ', 'type 3 question 9 ansc ', 'type 3 question 9 ansd ', 1, 'type 3 question 9 reason '),
(757, 4, 'type 4 question 1', 'type 4 question 1 ansa ', 'type 4 question 1 ansb ', 'type 4 question 1 ansc ', 'type 4 question 1 ansd ', 2, 'type 4 question 1 reason '),
(758, 4, 'type 4 question 2', 'type 4 question 2 ansa ', 'type 4 question 2 ansb ', 'type 4 question 2 ansc ', 'type 4 question 2 ansd ', 3, 'type 4 question 2 reason '),
(759, 4, 'type 4 question 3', 'type 4 question 3 ansa ', 'type 4 question 3 ansb ', 'type 4 question 3 ansc ', 'type 4 question 3 ansd ', 4, 'type 4 question 3 reason '),
(760, 4, 'type 4 question 4', 'type 4 question 4 ansa ', 'type 4 question 4 ansb ', 'type 4 question 4 ansc ', 'type 4 question 4 ansd ', 1, 'type 4 question 4 reason '),
(761, 4, 'type 4 question 5', 'type 4 question 5 ansa ', 'type 4 question 5 ansb ', 'type 4 question 5 ansc ', 'type 4 question 5 ansd ', 1, 'type 4 question 5 reason '),
(762, 4, 'type 4 question 6', 'type 4 question 6 ansa ', 'type 4 question 6 ansb ', 'type 4 question 6 ansc ', 'type 4 question 6 ansd ', 2, 'type 4 question 6 reason '),
(763, 4, 'type 4 question 7', 'type 4 question 7 ansa ', 'type 4 question 7 ansb ', 'type 4 question 7 ansc ', 'type 4 question 7 ansd ', 1, 'type 4 question 7 reason '),
(764, 4, 'type 4 question 8', 'type 4 question 8 ansa ', 'type 4 question 8 ansb ', 'type 4 question 8 ansc ', 'type 4 question 8 ansd ', 4, 'type 4 question 8 reason '),
(765, 4, 'type 4 question 9', 'type 4 question 9 ansa ', 'type 4 question 9 ansb ', 'type 4 question 9 ansc ', 'type 4 question 9 ansd ', 3, 'type 4 question 9 reason '),
(766, 5, 'type 5 question 1', 'type 5 question 1 ansa ', 'type 5 question 1 ansb ', 'type 5 question 1 ansc ', 'type 5 question 1 ansd ', 4, 'type 5 question 1 reason '),
(767, 5, 'type 5 question 2', 'type 5 question 2 ansa ', 'type 5 question 2 ansb ', 'type 5 question 2 ansc ', 'type 5 question 2 ansd ', 3, 'type 5 question 2 reason '),
(768, 5, 'type 5 question 3', 'type 5 question 3 ansa ', 'type 5 question 3 ansb ', 'type 5 question 3 ansc ', 'type 5 question 3 ansd ', 2, 'type 5 question 3 reason '),
(769, 5, 'type 5 question 4', 'type 5 question 4 ansa ', 'type 5 question 4 ansb ', 'type 5 question 4 ansc ', 'type 5 question 4 ansd ', 3, 'type 5 question 4 reason '),
(770, 5, 'type 5 question 5', 'type 5 question 5 ansa ', 'type 5 question 5 ansb ', 'type 5 question 5 ansc ', 'type 5 question 5 ansd ', 1, 'type 5 question 5 reason '),
(771, 5, 'type 5 question 6', 'type 5 question 6 ansa ', 'type 5 question 6 ansb ', 'type 5 question 6 ansc ', 'type 5 question 6 ansd ', 3, 'type 5 question 6 reason '),
(772, 5, 'type 5 question 7', 'type 5 question 7 ansa ', 'type 5 question 7 ansb ', 'type 5 question 7 ansc ', 'type 5 question 7 ansd ', 3, 'type 5 question 7 reason '),
(773, 5, 'type 5 question 8', 'type 5 question 8 ansa ', 'type 5 question 8 ansb ', 'type 5 question 8 ansc ', 'type 5 question 8 ansd ', 1, 'type 5 question 8 reason '),
(774, 5, 'type 5 question 9', 'type 5 question 9 ansa ', 'type 5 question 9 ansb ', 'type 5 question 9 ansc ', 'type 5 question 9 ansd ', 2, 'type 5 question 9 reason '),
(775, 6, 'type 6 question 1', 'type 6 question 1 ansa ', 'type 6 question 1 ansb ', 'type 6 question 1 ansc ', 'type 6 question 1 ansd ', 4, 'type 6 question 1 reason '),
(776, 6, 'type 6 question 2', 'type 6 question 2 ansa ', 'type 6 question 2 ansb ', 'type 6 question 2 ansc ', 'type 6 question 2 ansd ', 2, 'type 6 question 2 reason '),
(777, 6, 'type 6 question 3', 'type 6 question 3 ansa ', 'type 6 question 3 ansb ', 'type 6 question 3 ansc ', 'type 6 question 3 ansd ', 2, 'type 6 question 3 reason '),
(778, 6, 'type 6 question 4', 'type 6 question 4 ansa ', 'type 6 question 4 ansb ', 'type 6 question 4 ansc ', 'type 6 question 4 ansd ', 3, 'type 6 question 4 reason '),
(779, 6, 'type 6 question 5', 'type 6 question 5 ansa ', 'type 6 question 5 ansb ', 'type 6 question 5 ansc ', 'type 6 question 5 ansd ', 2, 'type 6 question 5 reason '),
(780, 6, 'type 6 question 6', 'type 6 question 6 ansa ', 'type 6 question 6 ansb ', 'type 6 question 6 ansc ', 'type 6 question 6 ansd ', 4, 'type 6 question 6 reason '),
(781, 6, 'type 6 question 7', 'type 6 question 7 ansa ', 'type 6 question 7 ansb ', 'type 6 question 7 ansc ', 'type 6 question 7 ansd ', 1, 'type 6 question 7 reason '),
(782, 6, 'type 6 question 8', 'type 6 question 8 ansa ', 'type 6 question 8 ansb ', 'type 6 question 8 ansc ', 'type 6 question 8 ansd ', 3, 'type 6 question 8 reason '),
(783, 6, 'type 6 question 9', 'type 6 question 9 ansa ', 'type 6 question 9 ansb ', 'type 6 question 9 ansc ', 'type 6 question 9 ansd ', 3, 'type 6 question 9 reason '),
(784, 7, 'type 7 question 1', 'type 7 question 1 ansa ', 'type 7 question 1 ansb ', 'type 7 question 1 ansc ', 'type 7 question 1 ansd ', 3, 'type 7 question 1 reason '),
(785, 7, 'type 7 question 2', 'type 7 question 2 ansa ', 'type 7 question 2 ansb ', 'type 7 question 2 ansc ', 'type 7 question 2 ansd ', 2, 'type 7 question 2 reason '),
(786, 7, 'type 7 question 3', 'type 7 question 3 ansa ', 'type 7 question 3 ansb ', 'type 7 question 3 ansc ', 'type 7 question 3 ansd ', 3, 'type 7 question 3 reason '),
(787, 7, 'type 7 question 4', 'type 7 question 4 ansa ', 'type 7 question 4 ansb ', 'type 7 question 4 ansc ', 'type 7 question 4 ansd ', 4, 'type 7 question 4 reason '),
(788, 7, 'type 7 question 5', 'type 7 question 5 ansa ', 'type 7 question 5 ansb ', 'type 7 question 5 ansc ', 'type 7 question 5 ansd ', 3, 'type 7 question 5 reason '),
(789, 7, 'type 7 question 6', 'type 7 question 6 ansa ', 'type 7 question 6 ansb ', 'type 7 question 6 ansc ', 'type 7 question 6 ansd ', 3, 'type 7 question 6 reason '),
(790, 7, 'type 7 question 7', 'type 7 question 7 ansa ', 'type 7 question 7 ansb ', 'type 7 question 7 ansc ', 'type 7 question 7 ansd ', 1, 'type 7 question 7 reason '),
(791, 7, 'type 7 question 8', 'type 7 question 8 ansa ', 'type 7 question 8 ansb ', 'type 7 question 8 ansc ', 'type 7 question 8 ansd ', 4, 'type 7 question 8 reason '),
(792, 7, 'type 7 question 9', 'type 7 question 9 ansa ', 'type 7 question 9 ansb ', 'type 7 question 9 ansc ', 'type 7 question 9 ansd ', 3, 'type 7 question 9 reason '),
(793, 8, 'type 8 question 1', 'type 8 question 1 ansa ', 'type 8 question 1 ansb ', 'type 8 question 1 ansc ', 'type 8 question 1 ansd ', 3, 'type 8 question 1 reason '),
(794, 8, 'type 8 question 2', 'type 8 question 2 ansa ', 'type 8 question 2 ansb ', 'type 8 question 2 ansc ', 'type 8 question 2 ansd ', 4, 'type 8 question 2 reason '),
(795, 8, 'type 8 question 3', 'type 8 question 3 ansa ', 'type 8 question 3 ansb ', 'type 8 question 3 ansc ', 'type 8 question 3 ansd ', 1, 'type 8 question 3 reason '),
(796, 8, 'type 8 question 4', 'type 8 question 4 ansa ', 'type 8 question 4 ansb ', 'type 8 question 4 ansc ', 'type 8 question 4 ansd ', 1, 'type 8 question 4 reason '),
(797, 8, 'type 8 question 5', 'type 8 question 5 ansa ', 'type 8 question 5 ansb ', 'type 8 question 5 ansc ', 'type 8 question 5 ansd ', 1, 'type 8 question 5 reason '),
(798, 8, 'type 8 question 6', 'type 8 question 6 ansa ', 'type 8 question 6 ansb ', 'type 8 question 6 ansc ', 'type 8 question 6 ansd ', 2, 'type 8 question 6 reason '),
(799, 8, 'type 8 question 7', 'type 8 question 7 ansa ', 'type 8 question 7 ansb ', 'type 8 question 7 ansc ', 'type 8 question 7 ansd ', 4, 'type 8 question 7 reason '),
(800, 8, 'type 8 question 8', 'type 8 question 8 ansa ', 'type 8 question 8 ansb ', 'type 8 question 8 ansc ', 'type 8 question 8 ansd ', 4, 'type 8 question 8 reason '),
(801, 8, 'type 8 question 9', 'type 8 question 9 ansa ', 'type 8 question 9 ansb ', 'type 8 question 9 ansc ', 'type 8 question 9 ansd ', 4, 'type 8 question 9 reason '),
(802, 9, 'type 9 question 1', 'type 9 question 1 ansa ', 'type 9 question 1 ansb ', 'type 9 question 1 ansc ', 'type 9 question 1 ansd ', 3, 'type 9 question 1 reason '),
(803, 9, 'type 9 question 2', 'type 9 question 2 ansa ', 'type 9 question 2 ansb ', 'type 9 question 2 ansc ', 'type 9 question 2 ansd ', 4, 'type 9 question 2 reason '),
(804, 9, 'type 9 question 3', 'type 9 question 3 ansa ', 'type 9 question 3 ansb ', 'type 9 question 3 ansc ', 'type 9 question 3 ansd ', 3, 'type 9 question 3 reason '),
(805, 9, 'type 9 question 4', 'type 9 question 4 ansa ', 'type 9 question 4 ansb ', 'type 9 question 4 ansc ', 'type 9 question 4 ansd ', 4, 'type 9 question 4 reason '),
(806, 9, 'type 9 question 5', 'type 9 question 5 ansa ', 'type 9 question 5 ansb ', 'type 9 question 5 ansc ', 'type 9 question 5 ansd ', 2, 'type 9 question 5 reason '),
(807, 9, 'type 9 question 6', 'type 9 question 6 ansa ', 'type 9 question 6 ansb ', 'type 9 question 6 ansc ', 'type 9 question 6 ansd ', 3, 'type 9 question 6 reason '),
(808, 9, 'type 9 question 7', 'type 9 question 7 ansa ', 'type 9 question 7 ansb ', 'type 9 question 7 ansc ', 'type 9 question 7 ansd ', 2, 'type 9 question 7 reason '),
(809, 9, 'type 9 question 8', 'type 9 question 8 ansa ', 'type 9 question 8 ansb ', 'type 9 question 8 ansc ', 'type 9 question 8 ansd ', 1, 'type 9 question 8 reason '),
(810, 9, 'type 9 question 9', 'type 9 question 9 ansa ', 'type 9 question 9 ansb ', 'type 9 question 9 ansc ', 'type 9 question 9 ansd ', 2, 'type 9 question 9 reason '),
(811, 10, 'type 10 question 1', 'type 10 question 1 ansa ', 'type 10 question 1 ansb ', 'type 10 question 1 ansc ', 'type 10 question 1 ansd ', 1, 'type 10 question 1 reason '),
(812, 10, 'type 10 question 2', 'type 10 question 2 ansa ', 'type 10 question 2 ansb ', 'type 10 question 2 ansc ', 'type 10 question 2 ansd ', 1, 'type 10 question 2 reason '),
(813, 10, 'type 10 question 3', 'type 10 question 3 ansa ', 'type 10 question 3 ansb ', 'type 10 question 3 ansc ', 'type 10 question 3 ansd ', 2, 'type 10 question 3 reason '),
(814, 10, 'type 10 question 4', 'type 10 question 4 ansa ', 'type 10 question 4 ansb ', 'type 10 question 4 ansc ', 'type 10 question 4 ansd ', 2, 'type 10 question 4 reason '),
(815, 10, 'type 10 question 5', 'type 10 question 5 ansa ', 'type 10 question 5 ansb ', 'type 10 question 5 ansc ', 'type 10 question 5 ansd ', 1, 'type 10 question 5 reason '),
(816, 10, 'type 10 question 6', 'type 10 question 6 ansa ', 'type 10 question 6 ansb ', 'type 10 question 6 ansc ', 'type 10 question 6 ansd ', 4, 'type 10 question 6 reason '),
(817, 10, 'type 10 question 7', 'type 10 question 7 ansa ', 'type 10 question 7 ansb ', 'type 10 question 7 ansc ', 'type 10 question 7 ansd ', 3, 'type 10 question 7 reason '),
(818, 10, 'type 10 question 8', 'type 10 question 8 ansa ', 'type 10 question 8 ansb ', 'type 10 question 8 ansc ', 'type 10 question 8 ansd ', 2, 'type 10 question 8 reason '),
(819, 10, 'type 10 question 9', 'type 10 question 9 ansa ', 'type 10 question 9 ansb ', 'type 10 question 9 ansc ', 'type 10 question 9 ansd ', 4, 'type 10 question 9 reason '),
(820, 11, 'type 11 question 1', 'type 11 question 1 ansa ', 'type 11 question 1 ansb ', 'type 11 question 1 ansc ', 'type 11 question 1 ansd ', 3, 'type 11 question 1 reason '),
(821, 11, 'type 11 question 2', 'type 11 question 2 ansa ', 'type 11 question 2 ansb ', 'type 11 question 2 ansc ', 'type 11 question 2 ansd ', 4, 'type 11 question 2 reason '),
(822, 11, 'type 11 question 3', 'type 11 question 3 ansa ', 'type 11 question 3 ansb ', 'type 11 question 3 ansc ', 'type 11 question 3 ansd ', 4, 'type 11 question 3 reason '),
(823, 11, 'type 11 question 4', 'type 11 question 4 ansa ', 'type 11 question 4 ansb ', 'type 11 question 4 ansc ', 'type 11 question 4 ansd ', 1, 'type 11 question 4 reason '),
(824, 11, 'type 11 question 5', 'type 11 question 5 ansa ', 'type 11 question 5 ansb ', 'type 11 question 5 ansc ', 'type 11 question 5 ansd ', 1, 'type 11 question 5 reason '),
(825, 11, 'type 11 question 6', 'type 11 question 6 ansa ', 'type 11 question 6 ansb ', 'type 11 question 6 ansc ', 'type 11 question 6 ansd ', 1, 'type 11 question 6 reason '),
(826, 11, 'type 11 question 7', 'type 11 question 7 ansa ', 'type 11 question 7 ansb ', 'type 11 question 7 ansc ', 'type 11 question 7 ansd ', 2, 'type 11 question 7 reason '),
(827, 11, 'type 11 question 8', 'type 11 question 8 ansa ', 'type 11 question 8 ansb ', 'type 11 question 8 ansc ', 'type 11 question 8 ansd ', 2, 'type 11 question 8 reason '),
(828, 11, 'type 11 question 9', 'type 11 question 9 ansa ', 'type 11 question 9 ansb ', 'type 11 question 9 ansc ', 'type 11 question 9 ansd ', 2, 'type 11 question 9 reason '),
(829, 12, 'type 12 question 1', 'type 12 question 1 ansa ', 'type 12 question 1 ansb ', 'type 12 question 1 ansc ', 'type 12 question 1 ansd ', 2, 'type 12 question 1 reason '),
(830, 12, 'type 12 question 2', 'type 12 question 2 ansa ', 'type 12 question 2 ansb ', 'type 12 question 2 ansc ', 'type 12 question 2 ansd ', 1, 'type 12 question 2 reason '),
(831, 12, 'type 12 question 3', 'type 12 question 3 ansa ', 'type 12 question 3 ansb ', 'type 12 question 3 ansc ', 'type 12 question 3 ansd ', 3, 'type 12 question 3 reason '),
(832, 12, 'type 12 question 4', 'type 12 question 4 ansa ', 'type 12 question 4 ansb ', 'type 12 question 4 ansc ', 'type 12 question 4 ansd ', 2, 'type 12 question 4 reason '),
(833, 12, 'type 12 question 5', 'type 12 question 5 ansa ', 'type 12 question 5 ansb ', 'type 12 question 5 ansc ', 'type 12 question 5 ansd ', 2, 'type 12 question 5 reason '),
(834, 12, 'type 12 question 6', 'type 12 question 6 ansa ', 'type 12 question 6 ansb ', 'type 12 question 6 ansc ', 'type 12 question 6 ansd ', 3, 'type 12 question 6 reason '),
(835, 12, 'type 12 question 7', 'type 12 question 7 ansa ', 'type 12 question 7 ansb ', 'type 12 question 7 ansc ', 'type 12 question 7 ansd ', 2, 'type 12 question 7 reason '),
(836, 12, 'type 12 question 8', 'type 12 question 8 ansa ', 'type 12 question 8 ansb ', 'type 12 question 8 ansc ', 'type 12 question 8 ansd ', 4, 'type 12 question 8 reason '),
(837, 12, 'type 12 question 9', 'type 12 question 9 ansa ', 'type 12 question 9 ansb ', 'type 12 question 9 ansc ', 'type 12 question 9 ansd ', 3, 'type 12 question 9 reason '),
(838, 13, 'type 13 question 1', 'type 13 question 1 ansa ', 'type 13 question 1 ansb ', 'type 13 question 1 ansc ', 'type 13 question 1 ansd ', 1, 'type 13 question 1 reason '),
(839, 13, 'type 13 question 2', 'type 13 question 2 ansa ', 'type 13 question 2 ansb ', 'type 13 question 2 ansc ', 'type 13 question 2 ansd ', 1, 'type 13 question 2 reason '),
(840, 13, 'type 13 question 3', 'type 13 question 3 ansa ', 'type 13 question 3 ansb ', 'type 13 question 3 ansc ', 'type 13 question 3 ansd ', 2, 'type 13 question 3 reason '),
(841, 13, 'type 13 question 4', 'type 13 question 4 ansa ', 'type 13 question 4 ansb ', 'type 13 question 4 ansc ', 'type 13 question 4 ansd ', 4, 'type 13 question 4 reason '),
(842, 13, 'type 13 question 5', 'type 13 question 5 ansa ', 'type 13 question 5 ansb ', 'type 13 question 5 ansc ', 'type 13 question 5 ansd ', 3, 'type 13 question 5 reason '),
(843, 13, 'type 13 question 6', 'type 13 question 6 ansa ', 'type 13 question 6 ansb ', 'type 13 question 6 ansc ', 'type 13 question 6 ansd ', 4, 'type 13 question 6 reason '),
(844, 13, 'type 13 question 7', 'type 13 question 7 ansa ', 'type 13 question 7 ansb ', 'type 13 question 7 ansc ', 'type 13 question 7 ansd ', 3, 'type 13 question 7 reason '),
(845, 13, 'type 13 question 8', 'type 13 question 8 ansa ', 'type 13 question 8 ansb ', 'type 13 question 8 ansc ', 'type 13 question 8 ansd ', 4, 'type 13 question 8 reason '),
(846, 13, 'type 13 question 9', 'type 13 question 9 ansa ', 'type 13 question 9 ansb ', 'type 13 question 9 ansc ', 'type 13 question 9 ansd ', 3, 'type 13 question 9 reason '),
(847, 14, 'type 14 question 1', 'type 14 question 1 ansa ', 'type 14 question 1 ansb ', 'type 14 question 1 ansc ', 'type 14 question 1 ansd ', 4, 'type 14 question 1 reason '),
(848, 14, 'type 14 question 2', 'type 14 question 2 ansa ', 'type 14 question 2 ansb ', 'type 14 question 2 ansc ', 'type 14 question 2 ansd ', 4, 'type 14 question 2 reason '),
(849, 14, 'type 14 question 3', 'type 14 question 3 ansa ', 'type 14 question 3 ansb ', 'type 14 question 3 ansc ', 'type 14 question 3 ansd ', 3, 'type 14 question 3 reason '),
(850, 14, 'type 14 question 4', 'type 14 question 4 ansa ', 'type 14 question 4 ansb ', 'type 14 question 4 ansc ', 'type 14 question 4 ansd ', 4, 'type 14 question 4 reason '),
(851, 14, 'type 14 question 5', 'type 14 question 5 ansa ', 'type 14 question 5 ansb ', 'type 14 question 5 ansc ', 'type 14 question 5 ansd ', 2, 'type 14 question 5 reason '),
(852, 14, 'type 14 question 6', 'type 14 question 6 ansa ', 'type 14 question 6 ansb ', 'type 14 question 6 ansc ', 'type 14 question 6 ansd ', 2, 'type 14 question 6 reason '),
(853, 14, 'type 14 question 7', 'type 14 question 7 ansa ', 'type 14 question 7 ansb ', 'type 14 question 7 ansc ', 'type 14 question 7 ansd ', 4, 'type 14 question 7 reason '),
(854, 14, 'type 14 question 8', 'type 14 question 8 ansa ', 'type 14 question 8 ansb ', 'type 14 question 8 ansc ', 'type 14 question 8 ansd ', 1, 'type 14 question 8 reason '),
(855, 14, 'type 14 question 9', 'type 14 question 9 ansa ', 'type 14 question 9 ansb ', 'type 14 question 9 ansc ', 'type 14 question 9 ansd ', 1, 'type 14 question 9 reason '),
(856, 15, 'type 15 question 1', 'type 15 question 1 ansa ', 'type 15 question 1 ansb ', 'type 15 question 1 ansc ', 'type 15 question 1 ansd ', 2, 'type 15 question 1 reason '),
(857, 15, 'type 15 question 2', 'type 15 question 2 ansa ', 'type 15 question 2 ansb ', 'type 15 question 2 ansc ', 'type 15 question 2 ansd ', 3, 'type 15 question 2 reason '),
(858, 15, 'type 15 question 3', 'type 15 question 3 ansa ', 'type 15 question 3 ansb ', 'type 15 question 3 ansc ', 'type 15 question 3 ansd ', 4, 'type 15 question 3 reason '),
(859, 15, 'type 15 question 4', 'type 15 question 4 ansa ', 'type 15 question 4 ansb ', 'type 15 question 4 ansc ', 'type 15 question 4 ansd ', 1, 'type 15 question 4 reason '),
(860, 15, 'type 15 question 5', 'type 15 question 5 ansa ', 'type 15 question 5 ansb ', 'type 15 question 5 ansc ', 'type 15 question 5 ansd ', 4, 'type 15 question 5 reason '),
(861, 15, 'type 15 question 6', 'type 15 question 6 ansa ', 'type 15 question 6 ansb ', 'type 15 question 6 ansc ', 'type 15 question 6 ansd ', 2, 'type 15 question 6 reason '),
(862, 15, 'type 15 question 7', 'type 15 question 7 ansa ', 'type 15 question 7 ansb ', 'type 15 question 7 ansc ', 'type 15 question 7 ansd ', 4, 'type 15 question 7 reason '),
(863, 15, 'type 15 question 8', 'type 15 question 8 ansa ', 'type 15 question 8 ansb ', 'type 15 question 8 ansc ', 'type 15 question 8 ansd ', 4, 'type 15 question 8 reason '),
(864, 15, 'type 15 question 9', 'type 15 question 9 ansa ', 'type 15 question 9 ansb ', 'type 15 question 9 ansc ', 'type 15 question 9 ansd ', 1, 'type 15 question 9 reason '),
(865, 16, 'type 16 question 1', 'type 16 question 1 ansa ', 'type 16 question 1 ansb ', 'type 16 question 1 ansc ', 'type 16 question 1 ansd ', 1, 'type 16 question 1 reason '),
(866, 16, 'type 16 question 2', 'type 16 question 2 ansa ', 'type 16 question 2 ansb ', 'type 16 question 2 ansc ', 'type 16 question 2 ansd ', 4, 'type 16 question 2 reason '),
(867, 16, 'type 16 question 3', 'type 16 question 3 ansa ', 'type 16 question 3 ansb ', 'type 16 question 3 ansc ', 'type 16 question 3 ansd ', 1, 'type 16 question 3 reason '),
(868, 16, 'type 16 question 4', 'type 16 question 4 ansa ', 'type 16 question 4 ansb ', 'type 16 question 4 ansc ', 'type 16 question 4 ansd ', 1, 'type 16 question 4 reason '),
(869, 16, 'type 16 question 5', 'type 16 question 5 ansa ', 'type 16 question 5 ansb ', 'type 16 question 5 ansc ', 'type 16 question 5 ansd ', 4, 'type 16 question 5 reason '),
(870, 16, 'type 16 question 6', 'type 16 question 6 ansa ', 'type 16 question 6 ansb ', 'type 16 question 6 ansc ', 'type 16 question 6 ansd ', 1, 'type 16 question 6 reason '),
(871, 16, 'type 16 question 7', 'type 16 question 7 ansa ', 'type 16 question 7 ansb ', 'type 16 question 7 ansc ', 'type 16 question 7 ansd ', 3, 'type 16 question 7 reason '),
(872, 16, 'type 16 question 8', 'type 16 question 8 ansa ', 'type 16 question 8 ansb ', 'type 16 question 8 ansc ', 'type 16 question 8 ansd ', 2, 'type 16 question 8 reason '),
(873, 16, 'type 16 question 9', 'type 16 question 9 ansa ', 'type 16 question 9 ansb ', 'type 16 question 9 ansc ', 'type 16 question 9 ansd ', 1, 'type 16 question 9 reason '),
(874, 17, 'type 17 question 1', 'type 17 question 1 ansa ', 'type 17 question 1 ansb ', 'type 17 question 1 ansc ', 'type 17 question 1 ansd ', 3, 'type 17 question 1 reason '),
(875, 17, 'type 17 question 2', 'type 17 question 2 ansa ', 'type 17 question 2 ansb ', 'type 17 question 2 ansc ', 'type 17 question 2 ansd ', 2, 'type 17 question 2 reason '),
(876, 17, 'type 17 question 3', 'type 17 question 3 ansa ', 'type 17 question 3 ansb ', 'type 17 question 3 ansc ', 'type 17 question 3 ansd ', 2, 'type 17 question 3 reason '),
(877, 17, 'type 17 question 4', 'type 17 question 4 ansa ', 'type 17 question 4 ansb ', 'type 17 question 4 ansc ', 'type 17 question 4 ansd ', 1, 'type 17 question 4 reason '),
(878, 17, 'type 17 question 5', 'type 17 question 5 ansa ', 'type 17 question 5 ansb ', 'type 17 question 5 ansc ', 'type 17 question 5 ansd ', 1, 'type 17 question 5 reason '),
(879, 17, 'type 17 question 6', 'type 17 question 6 ansa ', 'type 17 question 6 ansb ', 'type 17 question 6 ansc ', 'type 17 question 6 ansd ', 2, 'type 17 question 6 reason '),
(880, 17, 'type 17 question 7', 'type 17 question 7 ansa ', 'type 17 question 7 ansb ', 'type 17 question 7 ansc ', 'type 17 question 7 ansd ', 1, 'type 17 question 7 reason '),
(881, 17, 'type 17 question 8', 'type 17 question 8 ansa ', 'type 17 question 8 ansb ', 'type 17 question 8 ansc ', 'type 17 question 8 ansd ', 1, 'type 17 question 8 reason '),
(882, 17, 'type 17 question 9', 'type 17 question 9 ansa ', 'type 17 question 9 ansb ', 'type 17 question 9 ansc ', 'type 17 question 9 ansd ', 3, 'type 17 question 9 reason '),
(883, 18, 'type 18 question 1', 'type 18 question 1 ansa ', 'type 18 question 1 ansb ', 'type 18 question 1 ansc ', 'type 18 question 1 ansd ', 3, 'type 18 question 1 reason '),
(884, 18, 'type 18 question 2', 'type 18 question 2 ansa ', 'type 18 question 2 ansb ', 'type 18 question 2 ansc ', 'type 18 question 2 ansd ', 1, 'type 18 question 2 reason '),
(885, 18, 'type 18 question 3', 'type 18 question 3 ansa ', 'type 18 question 3 ansb ', 'type 18 question 3 ansc ', 'type 18 question 3 ansd ', 3, 'type 18 question 3 reason '),
(886, 18, 'type 18 question 4', 'type 18 question 4 ansa ', 'type 18 question 4 ansb ', 'type 18 question 4 ansc ', 'type 18 question 4 ansd ', 4, 'type 18 question 4 reason '),
(887, 18, 'type 18 question 5', 'type 18 question 5 ansa ', 'type 18 question 5 ansb ', 'type 18 question 5 ansc ', 'type 18 question 5 ansd ', 2, 'type 18 question 5 reason '),
(888, 18, 'type 18 question 6', 'type 18 question 6 ansa ', 'type 18 question 6 ansb ', 'type 18 question 6 ansc ', 'type 18 question 6 ansd ', 1, 'type 18 question 6 reason '),
(889, 18, 'type 18 question 7', 'type 18 question 7 ansa ', 'type 18 question 7 ansb ', 'type 18 question 7 ansc ', 'type 18 question 7 ansd ', 4, 'type 18 question 7 reason '),
(890, 18, 'type 18 question 8', 'type 18 question 8 ansa ', 'type 18 question 8 ansb ', 'type 18 question 8 ansc ', 'type 18 question 8 ansd ', 3, 'type 18 question 8 reason '),
(891, 18, 'type 18 question 9', 'type 18 question 9 ansa ', 'type 18 question 9 ansb ', 'type 18 question 9 ansc ', 'type 18 question 9 ansd ', 3, 'type 18 question 9 reason '),
(892, 19, 'type 19 question 1', 'type 19 question 1 ansa ', 'type 19 question 1 ansb ', 'type 19 question 1 ansc ', 'type 19 question 1 ansd ', 3, 'type 19 question 1 reason '),
(893, 19, 'type 19 question 2', 'type 19 question 2 ansa ', 'type 19 question 2 ansb ', 'type 19 question 2 ansc ', 'type 19 question 2 ansd ', 2, 'type 19 question 2 reason '),
(894, 19, 'type 19 question 3', 'type 19 question 3 ansa ', 'type 19 question 3 ansb ', 'type 19 question 3 ansc ', 'type 19 question 3 ansd ', 4, 'type 19 question 3 reason '),
(895, 19, 'type 19 question 4', 'type 19 question 4 ansa ', 'type 19 question 4 ansb ', 'type 19 question 4 ansc ', 'type 19 question 4 ansd ', 2, 'type 19 question 4 reason '),
(896, 19, 'type 19 question 5', 'type 19 question 5 ansa ', 'type 19 question 5 ansb ', 'type 19 question 5 ansc ', 'type 19 question 5 ansd ', 3, 'type 19 question 5 reason '),
(897, 19, 'type 19 question 6', 'type 19 question 6 ansa ', 'type 19 question 6 ansb ', 'type 19 question 6 ansc ', 'type 19 question 6 ansd ', 4, 'type 19 question 6 reason '),
(898, 19, 'type 19 question 7', 'type 19 question 7 ansa ', 'type 19 question 7 ansb ', 'type 19 question 7 ansc ', 'type 19 question 7 ansd ', 2, 'type 19 question 7 reason '),
(899, 19, 'type 19 question 8', 'type 19 question 8 ansa ', 'type 19 question 8 ansb ', 'type 19 question 8 ansc ', 'type 19 question 8 ansd ', 3, 'type 19 question 8 reason '),
(900, 19, 'type 19 question 9', 'type 19 question 9 ansa ', 'type 19 question 9 ansb ', 'type 19 question 9 ansc ', 'type 19 question 9 ansd ', 4, 'type 19 question 9 reason '),
(901, 20, 'type 20 question 1', 'type 20 question 1 ansa ', 'type 20 question 1 ansb ', 'type 20 question 1 ansc ', 'type 20 question 1 ansd ', 1, 'type 20 question 1 reason '),
(902, 20, 'type 20 question 2', 'type 20 question 2 ansa ', 'type 20 question 2 ansb ', 'type 20 question 2 ansc ', 'type 20 question 2 ansd ', 4, 'type 20 question 2 reason '),
(903, 20, 'type 20 question 3', 'type 20 question 3 ansa ', 'type 20 question 3 ansb ', 'type 20 question 3 ansc ', 'type 20 question 3 ansd ', 2, 'type 20 question 3 reason '),
(904, 20, 'type 20 question 4', 'type 20 question 4 ansa ', 'type 20 question 4 ansb ', 'type 20 question 4 ansc ', 'type 20 question 4 ansd ', 2, 'type 20 question 4 reason '),
(905, 20, 'type 20 question 5', 'type 20 question 5 ansa ', 'type 20 question 5 ansb ', 'type 20 question 5 ansc ', 'type 20 question 5 ansd ', 4, 'type 20 question 5 reason '),
(906, 20, 'type 20 question 6', 'type 20 question 6 ansa ', 'type 20 question 6 ansb ', 'type 20 question 6 ansc ', 'type 20 question 6 ansd ', 3, 'type 20 question 6 reason '),
(907, 20, 'type 20 question 7', 'type 20 question 7 ansa ', 'type 20 question 7 ansb ', 'type 20 question 7 ansc ', 'type 20 question 7 ansd ', 1, 'type 20 question 7 reason '),
(908, 20, 'type 20 question 8', 'type 20 question 8 ansa ', 'type 20 question 8 ansb ', 'type 20 question 8 ansc ', 'type 20 question 8 ansd ', 3, 'type 20 question 8 reason '),
(909, 20, 'type 20 question 9', 'type 20 question 9 ansa ', 'type 20 question 9 ansb ', 'type 20 question 9 ansc ', 'type 20 question 9 ansd ', 2, 'type 20 question 9 reason ');

-- --------------------------------------------------------

--
-- 表的结构 `follower`
--

CREATE TABLE `follower` (
  `star` int(11) NOT NULL,
  `fans` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `follower`
--

INSERT INTO `follower` (`star`, `fans`) VALUES
(865366186, 864738697),
(865366186, 865366186);

-- --------------------------------------------------------

--
-- 表的结构 `good`
--

CREATE TABLE `good` (
  `art_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `good`
--

INSERT INTO `good` (`art_id`, `user_id`) VALUES
(4, 853787575),
(2, 864738697),
(4, 864738697),
(2, 865366186),
(4, 865366186),
(5, 865366186),
(6, 865366186),
(7, 865366186),
(8, 865366186),
(10, 865366186);

--
-- 触发器 `good`
--
DELIMITER $$
CREATE TRIGGER `update_good_trigger` AFTER INSERT ON `good` FOR EACH ROW begin
  declare num int(11) default 0;
  select count(*) into num from good where art_id = new.art_id;
  update article
  set agreeNum = num
  where art_id = new.art_id;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `groupchat`
--

CREATE TABLE `groupchat` (
  `msg_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_name` varchar(256) NOT NULL,
  `msg` varchar(256) NOT NULL,
  `chattime` datetime NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `groupchat`
--

INSERT INTO `groupchat` (`msg_id`, `sender_id`, `sender_name`, `msg`, `chattime`, `room_id`) VALUES
(20, 865366186, 'Freeman', '你好？我是郑静深', '2021-03-13 12:24:24', 1),
(21, 864738697, 'Jasmine', '你好，我是郑洪娉', '2021-03-13 12:24:37', 1),
(22, 864738697, 'Jasmine', '你长得真帅', '2021-03-13 12:24:51', 1),
(23, 865366186, 'Freeman', '谢谢，你长得真丑', '2021-03-13 12:25:02', 1),
(24, 864738697, 'Jasmine', '2', '2021-03-13 12:26:04', 1),
(25, 864738697, 'Jasmine', '3', '2021-03-13 12:26:07', 1),
(26, 864738697, 'Jasmine', '4', '2021-03-13 12:26:10', 1),
(27, 864738697, 'Jasmine', '5', '2021-03-13 12:26:13', 1),
(28, 864738697, 'Jasmine', '6', '2021-03-13 12:26:16', 1),
(29, 864738697, 'Jasmine', '7', '2021-03-13 12:26:19', 1),
(30, 864738697, 'Jasmine', '8', '2021-03-13 12:26:22', 1),
(31, 864738697, 'Jasmine', '9', '2021-03-13 12:26:25', 1),
(32, 864738697, 'Jasmine', '10', '2021-03-13 12:26:30', 1),
(33, 864738697, 'Jasmine', '11', '2021-03-13 12:26:33', 1),
(34, 864738697, 'Jasmine', '12', '2021-03-13 12:26:36', 1),
(35, 864738697, 'Jasmine', '13', '2021-03-13 12:26:39', 1),
(36, 864738697, 'Jasmine', '14', '2021-03-13 12:26:41', 1),
(37, 864738697, 'Jasmine', '15', '2021-03-13 12:26:46', 1),
(38, 864738697, 'Jasmine', '16', '2021-03-13 12:26:49', 1),
(39, 864738697, 'Jasmine', '17', '2021-03-13 12:26:52', 1),
(40, 864738697, 'Jasmine', '18', '2021-03-13 12:26:55', 1),
(41, 864738697, 'Jasmine', '19', '2021-03-13 12:26:59', 1),
(42, 864738697, 'Jasmine', '20', '2021-03-13 12:27:03', 1),
(43, 864738697, 'Jasmine', '1', '2021-03-13 12:27:54', 1),
(44, 865366186, 'Freeman', 're', '2021-03-13 12:28:06', 1),
(45, 864738697, 'Jasmine', 're', '2021-03-13 12:28:11', 1),
(46, 865366186, 'Freeman', 'erter', '2021-03-13 12:28:14', 1),
(47, 865366186, 'Freeman', 'wqeq', '2021-03-13 18:28:33', 1),
(48, 864738697, 'jasmine1', '?', '2021-03-16 21:39:30', 1),
(49, 864738697, '郑洪娉', '2121', '2021-03-17 09:07:01', 1),
(50, 865366186, 'Freeman', 'ewqeq', '2021-03-17 09:07:16', 1),
(51, 865366186, 'Freeman', '3', '2021-03-19 23:24:40', 1),
(52, 865366186, 'Freeman', '42342', '2021-03-19 23:24:45', 1),
(53, 865366186, 'Freeman', '?', '2021-04-05 21:35:45', 1),
(54, 865366186, 'Freeman', '我', '2021-04-05 23:42:51', 66),
(55, 864738697, '郑洪娉', 'eqw', '2021-04-05 23:43:21', 66),
(56, 865366186, 'Freeman', 'w', '2021-04-05 23:54:46', 66),
(57, 865366186, 'Freeman', 'five', '2021-04-05 23:54:52', 66),
(58, 865366186, 'Freeman', '不喜欢学习。。', '2021-04-17 19:10:18', 66);

-- --------------------------------------------------------

--
-- 表的结构 `group_chat_room`
--

CREATE TABLE `group_chat_room` (
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(256) NOT NULL DEFAULT '这个房间里有很多有趣的人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `group_chat_room`
--

INSERT INTO `group_chat_room` (`room_id`, `user_id`, `description`) VALUES
(1, 865366186, '这个房间里有很多有趣的人'),
(66, 865366186, '讨论C  指针');

-- --------------------------------------------------------

--
-- 表的结构 `likes`
--

CREATE TABLE `likes` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `likes`
--

INSERT INTO `likes` (`review_id`, `user_id`) VALUES
(1, 853787575),
(2, 853787575),
(3, 853787575),
(5, 853787575),
(1, 864738697),
(2, 864738697),
(3, 864738697),
(5, 864738697),
(1, 865366186),
(2, 865366186),
(3, 865366186),
(5, 865366186),
(10, 865366186),
(1, 1453303975),
(2, 1453303975),
(3, 1453303975),
(5, 1453303975),
(1, 1453303976);

--
-- 触发器 `likes`
--
DELIMITER $$
CREATE TRIGGER `update_likes_trigger` AFTER INSERT ON `likes` FOR EACH ROW begin
  declare num int(11) default 0;
  select count(*) into num from likes where review_id = new.review_id;
  update review
  set likeNum = num
  where review_id = new.review_id;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  `viewer_id` int(11) NOT NULL,
  `content` varchar(2000) DEFAULT '',
  `likeNum` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `review`
--

INSERT INTO `review` (`review_id`, `art_id`, `viewer_id`, `content`, `likeNum`, `time`, `timestamp`) VALUES
(1, 2, 853787575, '我想啸！', 5, '2021-04-10 15:33:48', 1618040028),
(2, 2, 864738697, '我想去海边！！！', 4, '2021-04-10 15:34:18', 1618040058),
(3, 2, 1453303975, '我好想玩LOL', 4, '2021-04-10 15:34:35', 1618040075),
(4, 5, 865366186, '我是深圳大学的郑景深，请问我可以做你的研友吗？', 0, '2021-04-11 10:35:03', 1618108503),
(5, 2, 865366186, '你为什么伤心？', 4, '2021-04-11 14:00:48', 1618120848),
(6, 2, 1453303975, '你为什么伤心呢？', 0, '2021-04-11 14:19:51', 1618121991),
(7, 2, 1453303975, '你可能来自大潮汕！', 0, '2021-04-11 14:23:37', 1618122217),
(8, 2, 1453303975, '如果答案很多需要换行的话怎么办？\n怎么办~\n  测试一下吧', 0, '2021-04-11 14:24:02', 1618122242),
(9, 2, 1453303975, '我GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG', 0, '2021-04-11 14:24:20', 1618122260),
(10, 2, 1453303976, '北国风光，千里冰封，万里雪飘。<br/>望长城内外，惟余莽莽；大河上下，顿失滔滔。<br/>山舞银蛇，原驰蜡象，欲与天公试比高。<br/>须晴日，看红装素裹，分外妖娆。<br/>江山如此多娇，引无数英雄竞折腰。<br/>惜秦皇汉武，略输文采；唐宗宋祖，稍逊风骚。', 1, '2021-04-11 14:37:30', 1618123050);

-- --------------------------------------------------------

--
-- 表的结构 `sessionlogs`
--

CREATE TABLE `sessionlogs` (
  `session_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `interviewer` varchar(256) NOT NULL,
  `interviewee` varchar(256) NOT NULL,
  `create_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sessionlogs`
--

INSERT INTO `sessionlogs` (`session_id`, `room_id`, `interviewer`, `interviewee`, `create_time`) VALUES
(1, 88888, '864738697', '865366186', 1615552329),
(2, 88888, '864738697', '865366186', 1615620469),
(3, 6666, '864738697', '865366186', 1615620790),
(4, 88888, '864738697', '865366186', 1615621680),
(5, 88888, '864738697', '865366186', 1615621784),
(6, 88888, '864738697', '865366186', 1615621924),
(7, 88888, '864738697', '865366186', 1615622405),
(8, 88888, '864738697', '865366186', 1615622618),
(9, 6666, '864738697', '865366186', 1615622730),
(10, 88888, '864738697', '865366186', 1615622995),
(11, 1688, '853787575', '865366186', 1615623417),
(12, 88888, '864738697', '865366186', 1615623840),
(13, 99999, '864738697', '865366186', 1615624045),
(14, 8888, '864738697', '865366186', 1615631482),
(15, 8888, '864738697', '865366186', 1615704146),
(16, 9999, '864738697', '865366186', 1615704265),
(17, 6666, '864738697', '865366186', 1615942850),
(18, 88888, '864738697', '865366186', 1615943529),
(19, 6666, '864738697', '865366186', 1616056878),
(20, 318, '853787575', '865366186', 1616056977),
(21, 4396, '864738697', '865366186', 1616057562),
(22, 2200, '853787575', '865366186', 1616057711),
(23, 2800, '864738697', '865366186', 1616058176),
(24, 6666, '864738697', '865366186', 1616058604),
(25, 2200, '864738697', '865366186', 1616066939),
(26, 2200, '864738697', '865366186', 1616069547),
(27, 4396, '853787575', '865366186', 1616069665),
(28, 2200, '8537575', '865366186', 1616071683),
(29, 4396, '853787575', '865366186', 1616071706),
(30, 9999, '864738697', '865366186', 1616071858),
(31, 2200, '853787575', '865366186', 1616072009),
(32, 9999, '853787575', '865366186', 1616072613),
(33, 2200, '853787575', '865366186', 1616072831),
(34, 111, '864738697', '865366186', 1616072952),
(35, 4396, '864738697', '865366186', 1616082272),
(36, 4396, '864738697', '865366186', 1616083279),
(37, 2200, '1453303976', '865366186', 1616085099),
(38, 8888, '864738697', '865366186', 1616165938),
(39, 8888, '864738697', '865366186', 1617699250),
(40, 9999, '864738697', '1453303975', 1617701755),
(41, 223, '864738697', '865366186', 1617702083),
(42, 6666, '864738697', '865366186', 1617718700),
(43, 9999, '864738697', '865366186', 1617721623),
(44, 1234, '864738697', '865366186', 1617721862),
(45, 34888, '864738697', '865366186', 1617722480),
(46, 4396, '853787575', '865366186', 1617722696),
(47, 2200, '853787575', '865366186', 1617722784),
(48, 4397, '1453303975', '865366186', 1617723032),
(49, 4397, '865366186', '1453303975', 1617723139),
(50, 2333, '864738697', '865366186', 1617723466),
(51, 7777, '1453303976', '865366186', 1617723683),
(52, 3333, '864738697', '865366186', 1617725470),
(53, 1234, '864738697', '865366186', 1617757612),
(54, 4396, '864738697', '865366186', 1618127576),
(55, 4399, '853787575', '865366186', 1618127625),
(56, 2200, '1453303975', '865366186', 1618127791),
(57, 90000, '1453303976', '865366186', 1618127952),
(58, 3651, '864738697', '865366186', 1618129228),
(59, 5235, '853787575', '865366186', 1618129772),
(60, 864738697, '4396', '865366186', 1618657977),
(61, 4396, '864738697', '865366186', 1618658077);

-- --------------------------------------------------------

--
-- 表的结构 `singlechat`
--

CREATE TABLE `singlechat` (
  `msg_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `msg` varchar(256) NOT NULL,
  `chattime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `singlechat`
--

INSERT INTO `singlechat` (`msg_id`, `sender_id`, `receiver_id`, `msg`, `chattime`) VALUES
(1, 865366186, 864738697, 'nihao', '2021-03-10 00:00:00'),
(3, 865366186, 864738697, 'nihao', '2021-03-10 00:00:00'),
(5, 864738697, 865366186, 'wwwwwww', '2021-03-13 15:46:09'),
(6, 865366186, 864738697, 'ere', '2021-03-13 16:24:18'),
(7, 864738697, 865366186, 'rwe', '2021-03-13 16:24:22'),
(8, 864738697, 865366186, '不喜欢学习', '2021-03-13 16:25:07'),
(9, 865366186, 864738697, '我也是', '2021-03-13 16:25:31'),
(10, 864738697, 865366186, '真的吗2', '2021-03-13 16:25:36'),
(11, 864738697, 865366186, 'w', '2021-03-13 16:27:44'),
(14, 864738697, 865366186, 'w', '2021-03-13 18:31:50'),
(15, 853787575, 864738697, 'www', '2021-03-14 05:12:12'),
(16, 864738697, 865366186, 'qwwq', '2021-03-14 14:43:21'),
(17, 865366186, 864738697, 'qwwq', '2021-03-14 14:43:26'),
(18, 864738697, 865366186, '而我却', '2021-03-17 09:12:45'),
(19, 865366186, 853787575, '111', '2021-03-18 20:15:43'),
(20, 853787575, 865366186, '12', '2021-03-18 21:04:01'),
(21, 853787575, 865366186, '12', '2021-03-18 21:04:06'),
(22, 865366186, 853787575, '21', '2021-03-18 21:04:13'),
(23, 865366186, 864738697, 'asdas', '2021-03-18 21:09:33'),
(24, 865366186, 864738697, 'wooow', '2021-03-18 23:45:28'),
(25, 865366186, 864738697, '你知道为什么我这么帅吗？你猜猜看？', '2021-03-18 23:45:39'),
(26, 865366186, 864738697, '呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃', '2021-03-18 23:45:50'),
(27, 864738697, 865366186, 'eeeeeeeeeeee', '2021-03-19 00:02:06'),
(28, 1453303976, 865366186, 'e', '2021-03-19 00:31:56'),
(29, 865366186, 1453303976, '2', '2021-03-19 00:32:13'),
(30, 1453303976, 865366186, 'e', '2021-03-19 00:37:23'),
(31, 864738697, 865366186, 'w', '2021-04-06 16:54:57'),
(32, 864738697, 865366186, 'ewq', '2021-04-06 16:55:02'),
(33, 864738697, 1453303975, 'ew', '2021-04-06 17:36:11'),
(34, 1453303975, 864738697, 'good', '2021-04-06 17:36:18'),
(35, 864738697, 865366186, 'w', '2021-04-07 00:11:28');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `online` int(2) NOT NULL DEFAULT '0',
  `admin` int(2) NOT NULL DEFAULT '0',
  `pic_path` varchar(100) NOT NULL DEFAULT 'headpic_default.jpg',
  `last_login` datetime DEFAULT NULL,
  `sex` varchar(6) NOT NULL DEFAULT 'male',
  `tel` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `salary` varchar(10) DEFAULT NULL,
  `job` varchar(10) DEFAULT NULL,
  `sign` varchar(100) DEFAULT '他还没有设定个性签名~',
  `intro` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `online`, `admin`, `pic_path`, `last_login`, `sex`, `tel`, `mail`, `school`, `city`, `salary`, `job`, `sign`, `intro`) VALUES
(853787575, '枫叶霜飞', '123456asdf', 0, 0, 'headpic_default.jpg', '2021-04-11 16:29:48', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(864738697, '郑洪娉', 'zhp09142020', 0, 0, 'head_pic_864738697.jpg', '2021-04-17 19:14:14', 'male', '13699885322', '864738697@qq.com', '北京大学', '北京市北京市辖区海淀区', '5000', '翻译官', 'I can speak English well', 'I am Hongping Zheng'),
(865366186, 'Freeman', 'f5c41e7c3ee9f1cb9b4b6f41b465987b', 0, 1, 'head_pic_865366186.jpg', '2021-04-18 10:52:33', 'male', '13631517232', '865366186@qq.com', '深圳大学', '天津市天津市辖区河东区', '5000', '软件工程师', '你好', 'Goooooogle'),
(1453303975, '根号三', 'whoisyourdady', 0, 2, 'headpic_default.jpg', '2021-04-11 15:56:17', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1453303976, 'RoyalNeverGiveUp', 'uziforevergod', 0, 0, 'headpic_default.jpg', '2021-04-11 15:58:54', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`art_id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- Indexes for table `browse`
--
ALTER TABLE `browse`
  ADD PRIMARY KEY (`userid`,`art_id`,`time`),
  ADD KEY `art_id` (`art_id`);

--
-- Indexes for table `collect`
--
ALTER TABLE `collect`
  ADD PRIMARY KEY (`collecter`,`art_id`),
  ADD KEY `art_id` (`art_id`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follower`
--
ALTER TABLE `follower`
  ADD PRIMARY KEY (`star`,`fans`),
  ADD KEY `fans` (`fans`);

--
-- Indexes for table `good`
--
ALTER TABLE `good`
  ADD PRIMARY KEY (`art_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `groupchat`
--
ALTER TABLE `groupchat`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `group_chat_room`
--
ALTER TABLE `group_chat_room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`review_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `art_id` (`art_id`),
  ADD KEY `viewer_id` (`viewer_id`);

--
-- Indexes for table `sessionlogs`
--
ALTER TABLE `sessionlogs`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `singlechat`
--
ALTER TABLE `singlechat`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `article`
--
ALTER TABLE `article`
  MODIFY `art_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `exercise`
--
ALTER TABLE `exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=910;
--
-- 使用表AUTO_INCREMENT `groupchat`
--
ALTER TABLE `groupchat`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- 使用表AUTO_INCREMENT `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `sessionlogs`
--
ALTER TABLE `sessionlogs`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- 使用表AUTO_INCREMENT `singlechat`
--
ALTER TABLE `singlechat`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1453303977;
--
-- 限制导出的表
--

--
-- 限制表 `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`poster_id`) REFERENCES `user` (`id`);

--
-- 限制表 `browse`
--
ALTER TABLE `browse`
  ADD CONSTRAINT `browse_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `browse_ibfk_2` FOREIGN KEY (`art_id`) REFERENCES `article` (`art_id`);

--
-- 限制表 `collect`
--
ALTER TABLE `collect`
  ADD CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`collecter`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`art_id`) REFERENCES `article` (`art_id`);

--
-- 限制表 `follower`
--
ALTER TABLE `follower`
  ADD CONSTRAINT `follower_ibfk_1` FOREIGN KEY (`star`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `follower_ibfk_2` FOREIGN KEY (`fans`) REFERENCES `user` (`id`);

--
-- 限制表 `good`
--
ALTER TABLE `good`
  ADD CONSTRAINT `good_ibfk_1` FOREIGN KEY (`art_id`) REFERENCES `article` (`art_id`),
  ADD CONSTRAINT `good_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- 限制表 `groupchat`
--
ALTER TABLE `groupchat`
  ADD CONSTRAINT `groupchat_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `room_id` FOREIGN KEY (`room_id`) REFERENCES `group_chat_room` (`room_id`);

--
-- 限制表 `group_chat_room`
--
ALTER TABLE `group_chat_room`
  ADD CONSTRAINT `group_chat_room_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- 限制表 `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- 限制表 `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`art_id`) REFERENCES `article` (`art_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`viewer_id`) REFERENCES `user` (`id`);

--
-- 限制表 `singlechat`
--
ALTER TABLE `singlechat`
  ADD CONSTRAINT `singlechat_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `singlechat_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
