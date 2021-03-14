-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2021-03-14 07:38:03
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

-- --------------------------------------------------------

--
-- 表的结构 `agreelist`
--

CREATE TABLE `agreelist` (
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `art_id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `content` varchar(8000) NOT NULL,
  `time` datetime NOT NULL,
  `topic` varchar(200) NOT NULL,
  `job` varchar(200) NOT NULL,
  `loc` varchar(200) NOT NULL,
  `company` varchar(100) NOT NULL,
  `agree` int(5) NOT NULL DEFAULT '0',
  `collect` int(5) NOT NULL DEFAULT '0',
  `review` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`art_id`, `poster_id`, `content`, `time`, `topic`, `job`, `loc`, `company`, `agree`, `collect`, `review`) VALUES
(2, 865366186, 'where am i from?', '2021-03-07 23:08:08', 'A sad night', 'JAVA工程师', '上海', '腾讯', 0, 0, 0),
(4, 865366186, 'Mamba Out', '2021-03-07 23:12:45', 'what can I say?', '产品经理', '杭州', '阿里巴巴', 0, 0, 0),
(5, 865366186, '恶趣味请问', '2021-03-08 09:56:46', '克莱登', 'JAVA工程师', '深圳', '百度', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `collectlist`
--

CREATE TABLE `collectlist` (
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 1, 'java testing', 'i am a', 'i am b', 'i am c', 'i am d', 1, 'the reason is that....'),
(2, 1, 'C++ testing.....', 'ansA', 'ansB', 'asnC', 'asnD', 4, 'the reason is that b....'),
(3, 1, '"python testing....."', 'pa', 'pb', 'pc', 'pd', 2, 'the reason is that c.....');

-- --------------------------------------------------------

--
-- 表的结构 `groupchat`
--

CREATE TABLE `groupchat` (
  `msg_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_name` varchar(256) NOT NULL,
  `msg` varchar(256) NOT NULL,
  `chattime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `groupchat`
--

INSERT INTO `groupchat` (`msg_id`, `sender_id`, `sender_name`, `msg`, `chattime`) VALUES
(20, 865366186, 'Freeman', '你好？我是郑静深', '2021-03-13 12:24:24'),
(21, 864738697, 'Jasmine', '你好，我是郑洪娉', '2021-03-13 12:24:37'),
(22, 864738697, 'Jasmine', '你长得真帅', '2021-03-13 12:24:51'),
(23, 865366186, 'Freeman', '谢谢，你长得真丑', '2021-03-13 12:25:02'),
(24, 864738697, 'Jasmine', '2', '2021-03-13 12:26:04'),
(25, 864738697, 'Jasmine', '3', '2021-03-13 12:26:07'),
(26, 864738697, 'Jasmine', '4', '2021-03-13 12:26:10'),
(27, 864738697, 'Jasmine', '5', '2021-03-13 12:26:13'),
(28, 864738697, 'Jasmine', '6', '2021-03-13 12:26:16'),
(29, 864738697, 'Jasmine', '7', '2021-03-13 12:26:19'),
(30, 864738697, 'Jasmine', '8', '2021-03-13 12:26:22'),
(31, 864738697, 'Jasmine', '9', '2021-03-13 12:26:25'),
(32, 864738697, 'Jasmine', '10', '2021-03-13 12:26:30'),
(33, 864738697, 'Jasmine', '11', '2021-03-13 12:26:33'),
(34, 864738697, 'Jasmine', '12', '2021-03-13 12:26:36'),
(35, 864738697, 'Jasmine', '13', '2021-03-13 12:26:39'),
(36, 864738697, 'Jasmine', '14', '2021-03-13 12:26:41'),
(37, 864738697, 'Jasmine', '15', '2021-03-13 12:26:46'),
(38, 864738697, 'Jasmine', '16', '2021-03-13 12:26:49'),
(39, 864738697, 'Jasmine', '17', '2021-03-13 12:26:52'),
(40, 864738697, 'Jasmine', '18', '2021-03-13 12:26:55'),
(41, 864738697, 'Jasmine', '19', '2021-03-13 12:26:59'),
(42, 864738697, 'Jasmine', '20', '2021-03-13 12:27:03'),
(43, 864738697, 'Jasmine', '1', '2021-03-13 12:27:54'),
(44, 865366186, 'Freeman', 're', '2021-03-13 12:28:06'),
(45, 864738697, 'Jasmine', 're', '2021-03-13 12:28:11'),
(46, 865366186, 'Freeman', 'erter', '2021-03-13 12:28:14'),
(47, 865366186, 'Freeman', 'wqeq', '2021-03-13 18:28:33');

-- --------------------------------------------------------

--
-- 表的结构 `reviewlist`
--

CREATE TABLE `reviewlist` (
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `review` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(16, 9999, '864738697', '865366186', 1615704265);

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
(17, 865366186, 864738697, 'qwwq', '2021-03-14 14:43:26');

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
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `online`, `admin`, `pic_path`, `last_login`) VALUES
(853787575, '枫叶霜飞', '123456asdf', 0, 0, 'headpic_default.jpg', NULL),
(864738697, 'Jasmine', 'zhp09142020', 0, 0, 'headpic_default.jpg', '2021-03-14 14:44:06'),
(865366186, 'Freeman', 'bestzjs666', 0, 1, 'headpic_default.jpg', '2021-03-14 14:29:38'),
(1453303975, '根号三', 'whoisyourdady', 0, 0, 'headpic_default.jpg', NULL),
(1453303976, 'RoyalNeverGiveUp', 'uziforevergod', 0, 0, 'headpic_default.jpg', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agreelist`
--
ALTER TABLE `agreelist`
  ADD PRIMARY KEY (`user_id`,`article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`art_id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- Indexes for table `collectlist`
--
ALTER TABLE `collectlist`
  ADD PRIMARY KEY (`user_id`,`article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupchat`
--
ALTER TABLE `groupchat`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `reviewlist`
--
ALTER TABLE `reviewlist`
  ADD PRIMARY KEY (`user_id`,`article_id`),
  ADD KEY `article_id` (`article_id`);

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
  MODIFY `art_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `exercise`
--
ALTER TABLE `exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `groupchat`
--
ALTER TABLE `groupchat`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- 使用表AUTO_INCREMENT `sessionlogs`
--
ALTER TABLE `sessionlogs`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `singlechat`
--
ALTER TABLE `singlechat`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1453303977;
--
-- 限制导出的表
--

--
-- 限制表 `agreelist`
--
ALTER TABLE `agreelist`
  ADD CONSTRAINT `agreelist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `agreelist_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`art_id`);

--
-- 限制表 `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`poster_id`) REFERENCES `user` (`id`);

--
-- 限制表 `collectlist`
--
ALTER TABLE `collectlist`
  ADD CONSTRAINT `collectlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `collectlist_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`art_id`);

--
-- 限制表 `groupchat`
--
ALTER TABLE `groupchat`
  ADD CONSTRAINT `groupchat_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`);

--
-- 限制表 `reviewlist`
--
ALTER TABLE `reviewlist`
  ADD CONSTRAINT `reviewlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `reviewlist_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`art_id`);

--
-- 限制表 `singlechat`
--
ALTER TABLE `singlechat`
  ADD CONSTRAINT `singlechat_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `singlechat_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
