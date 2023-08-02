/*
 Navicat Premium Data Transfer

 Source Server         : Hc766443
 Source Server Type    : MySQL
 Source Server Version : 80028 (8.0.28)
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 80028 (8.0.28)
 File Encoding         : 65001

 Date: 25/05/2023 11:34:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for asrc
-- ----------------------------
DROP TABLE IF EXISTS `asrc`;
CREATE TABLE `asrc`  (
  `idx` int NULL DEFAULT NULL COMMENT '动作编号',
  `introduct` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '修改idx数值，触发相应函数\r\nASRC极光科研中心' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of asrc
-- ----------------------------
INSERT INTO `asrc` VALUES (1, 'SXH_NB233');

-- ----------------------------
-- Table structure for jc
-- ----------------------------
DROP TABLE IF EXISTS `jc`;
CREATE TABLE `jc`  (
  `idx` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `jcTime` date NULL DEFAULT NULL COMMENT '奖惩时间',
  `jcMoney` float NULL DEFAULT NULL COMMENT '奖惩金额 （有正有负）',
  `jcDis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '奖惩描述',
  PRIMARY KEY (`idx`) USING BTREE,
  INDEX `asd`(`userID` ASC) USING BTREE,
  CONSTRAINT `asd` FOREIGN KEY (`userID`) REFERENCES `tbl_user_info` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jc
-- ----------------------------
INSERT INTO `jc` VALUES (3, 4, '2022-12-26', 100, '见义勇为');
INSERT INTO `jc` VALUES (4, 4, '2022-12-26', -50, '迟到');
INSERT INTO `jc` VALUES (5, 4, '2022-12-26', 65, '奖励1');
INSERT INTO `jc` VALUES (6, 4, '2022-12-26', 45, '奖励2');
INSERT INTO `jc` VALUES (7, 3, '2022-12-27', 100, '出差奖励');
INSERT INTO `jc` VALUES (8, 4, '2022-10-04', 100, '太帅了');
INSERT INTO `jc` VALUES (9, 7, '2023-01-18', 44, '呼吸补贴');
INSERT INTO `jc` VALUES (10, 7, '2023-01-06', 77, '喝水补贴');
INSERT INTO `jc` VALUES (11, 5, '2023-05-07', -1000, '装B');
INSERT INTO `jc` VALUES (12, 5, '2023-05-07', 100, '见义勇为');

-- ----------------------------
-- Table structure for rest
-- ----------------------------
DROP TABLE IF EXISTS `rest`;
CREATE TABLE `rest`  (
  `idx` int NOT NULL AUTO_INCREMENT COMMENT '请假编号，解决冲突问题',
  `userID` int NOT NULL COMMENT '用户编号',
  `t1` date NOT NULL COMMENT '出发时间',
  `t2` date NOT NULL COMMENT '返回时间',
  `dis` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请假理由',
  `agree` int NOT NULL DEFAULT 0 COMMENT '审批情况',
  PRIMARY KEY (`idx`, `userID`) USING BTREE,
  INDEX `T1`(`userID` ASC) USING BTREE,
  CONSTRAINT `T1` FOREIGN KEY (`userID`) REFERENCES `tbl_user_info` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rest
-- ----------------------------
INSERT INTO `rest` VALUES (23, 7, '2023-01-01', '2023-01-19', '请假申请1', 1);
INSERT INTO `rest` VALUES (25, 1, '2023-01-11', '2023-01-21', '复活节弹吉他的', 1);
INSERT INTO `rest` VALUES (26, 5, '2023-05-01', '2023-05-08', '我好伤心啊', 2);
INSERT INTO `rest` VALUES (27, 5, '2023-05-01', '2023-05-02', '初始状态测试', 0);
INSERT INTO `rest` VALUES (28, 5, '2023-05-22', '2023-05-23', '我家母猪要生了', 2);
INSERT INTO `rest` VALUES (29, 5, '2023-05-23', '2023-05-24', '我好帅啊', 0);

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign`  (
  `userID` int NULL DEFAULT NULL,
  `t` time NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '签到表，每天刷新' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES (2, '08:00:00');
INSERT INTO `sign` VALUES (3, '08:00:00');
INSERT INTO `sign` VALUES (3, '17:00:00');
INSERT INTO `sign` VALUES (4, '08:05:00');
INSERT INTO `sign` VALUES (4, '17:00:00');
INSERT INTO `sign` VALUES (5, '08:00:00');
INSERT INTO `sign` VALUES (6, '08:00:00');
INSERT INTO `sign` VALUES (7, '08:00:00');
INSERT INTO `sign` VALUES (8, '08:00:00');
INSERT INTO `sign` VALUES (9, '08:00:00');
INSERT INTO `sign` VALUES (10, '08:00:00');
INSERT INTO `sign` VALUES (11, '08:00:00');

-- ----------------------------
-- Table structure for tbl_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_info`;
CREATE TABLE `tbl_user_info`  (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userPwd` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'MD5加密后32位',
  `userSex` int NULL DEFAULT NULL COMMENT '1男 2女',
  `userEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userBirthday` date NULL DEFAULT NULL,
  `depart` int NOT NULL COMMENT '是否是经理',
  `WID` int NOT NULL COMMENT '职位编号',
  `WName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位名称',
  PRIMARY KEY (`userID`, `userEmail`) USING BTREE,
  UNIQUE INDEX `ASD`(`userName` ASC) USING BTREE COMMENT 'userName唯一性约束',
  INDEX `WID`(`WID` ASC) USING BTREE,
  CONSTRAINT `WID` FOREIGN KEY (`WID`) REFERENCES `work` (`WID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_user_info
-- ----------------------------
INSERT INTO `tbl_user_info` VALUES (1, '何超', '7c497868c9e6d3e4cf2e87396372cd3b', 1, 'HC@qq.com', '2002-03-05', 1, 1, '经理');
INSERT INTO `tbl_user_info` VALUES (2, '苏晓辉', '202cb962ac59075b964b07152d234b70', 2, 'c7', '1999-01-04', 0, 2, '科研');
INSERT INTO `tbl_user_info` VALUES (3, '林辰卉', '202cb962ac59075b964b07152d234b70', 2, 'c1', '1988-12-26', 0, 3, '后勤');
INSERT INTO `tbl_user_info` VALUES (4, '江雨涵', '202cb962ac59075b964b07152d234b70', 2, 'c2', '1990-02-01', 0, 2, '科研');
INSERT INTO `tbl_user_info` VALUES (5, '孙笑川', '202cb962ac59075b964b07152d234b70', 1, 'c', '1980-06-18', 0, 3, '后勤');
INSERT INTO `tbl_user_info` VALUES (6, '李澳成', '202cb962ac59075b964b07152d234b70', 1, 'c4', '2022-12-29', 0, 2, '科研');
INSERT INTO `tbl_user_info` VALUES (7, '川建国', '202cb962ac59075b964b07152d234b70', 1, 'c5', '2023-01-04', 0, 3, '后勤');
INSERT INTO `tbl_user_info` VALUES (8, '瞌睡乔', '202cb962ac59075b964b07152d234b70', 1, 'c6', '2023-01-04', 0, 2, '科研');
INSERT INTO `tbl_user_info` VALUES (9, '程辉', '202cb962ac59075b964b07152d234b70', 1, 'cc', '2002-03-13', 1, 1, '经理');
INSERT INTO `tbl_user_info` VALUES (10, '林雅婷', '202cb962ac59075b964b07152d234b70', 2, '2745409660@qq.com', '2023-05-05', 1, 1, '经理');
INSERT INTO `tbl_user_info` VALUES (11, 'SWB', '202cb962ac59075b964b07152d234b70', 1, '123123', '2023-05-01', 0, 2, '科研');

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `WID` int NOT NULL COMMENT '职位ID',
  `WName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位名称',
  `WMoney` int NULL DEFAULT NULL COMMENT '每月工资',
  PRIMARY KEY (`WID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES (1, '经理', 9500);
INSERT INTO `work` VALUES (2, '科研', 11000);
INSERT INTO `work` VALUES (3, '后勤', 6500);

-- ----------------------------
-- Table structure for work_time
-- ----------------------------
DROP TABLE IF EXISTS `work_time`;
CREATE TABLE `work_time`  (
  `idx` int NULL DEFAULT NULL COMMENT '标定值',
  `t1` time NULL DEFAULT NULL COMMENT '上班时间',
  `t2` time NULL DEFAULT NULL COMMENT '下班时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_time
-- ----------------------------
INSERT INTO `work_time` VALUES (233, '08:00:00', '17:00:00');

-- ----------------------------
-- View structure for 1-上班时间
-- ----------------------------
DROP VIEW IF EXISTS `1-上班时间`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `1-上班时间` AS select `当日出勤情况-1`.`userID` AS `userID`,`出勤次数分析-3`.`cnt` AS `出勤次数`,min(`当日出勤情况-1`.`TIME_TO_SEC(sign.t)`) AS `上班时间` from (`当日出勤情况-1` join `出勤次数分析-3` on((`当日出勤情况-1`.`userID` = `出勤次数分析-3`.`userID`))) where (`出勤次数分析-3`.`cnt` >= 1) group by `当日出勤情况-1`.`userID` order by `当日出勤情况-1`.`userID`;

-- ----------------------------
-- View structure for 1-下班时间
-- ----------------------------
DROP VIEW IF EXISTS `1-下班时间`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `1-下班时间` AS select `当日出勤情况-1`.`userID` AS `userID`,`出勤次数分析-3`.`cnt` AS `出勤次数`,max(`当日出勤情况-1`.`TIME_TO_SEC(sign.t)`) AS `下班时间` from (`当日出勤情况-1` join `出勤次数分析-3` on((`当日出勤情况-1`.`userID` = `出勤次数分析-3`.`userID`))) where (`出勤次数分析-3`.`cnt` = 2) group by `当日出勤情况-1`.`userID` order by `当日出勤情况-1`.`userID`;

-- ----------------------------
-- View structure for 2-早退者
-- ----------------------------
DROP VIEW IF EXISTS `2-早退者`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `2-早退者` AS select `1-下班时间`.`userID` AS `userID`,`1-下班时间`.`下班时间` AS `下班时间` from (`1-下班时间` join `基准1-上下班时间`) where (`1-下班时间`.`下班时间` < `基准1-上下班时间`.`t2`);

-- ----------------------------
-- View structure for 2-迟到者
-- ----------------------------
DROP VIEW IF EXISTS `2-迟到者`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `2-迟到者` AS select `1-上班时间`.`userID` AS `userID`,`1-上班时间`.`上班时间` AS `上班时间` from (`1-上班时间` join `基准1-上下班时间`) where (`1-上班时间`.`上班时间` > `基准1-上下班时间`.`t1`);

-- ----------------------------
-- View structure for 3-早退人数
-- ----------------------------
DROP VIEW IF EXISTS `3-早退人数`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `3-早退人数` AS select count(0) AS `count(*)` from `2-早退者`;

-- ----------------------------
-- View structure for 3-迟到人数
-- ----------------------------
DROP VIEW IF EXISTS `3-迟到人数`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `3-迟到人数` AS select count(0) AS `count(*)` from `2-迟到者`;

-- ----------------------------
-- View structure for num-下班
-- ----------------------------
DROP VIEW IF EXISTS `num-下班`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `num-下班` AS select count(0) AS `count(*)` from `分析3-下班`;

-- ----------------------------
-- View structure for num-在岗
-- ----------------------------
DROP VIEW IF EXISTS `num-在岗`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `num-在岗` AS select count(0) AS `count(*)` from `分析2-在岗`;

-- ----------------------------
-- View structure for num-未签到
-- ----------------------------
DROP VIEW IF EXISTS `num-未签到`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `num-未签到` AS select count(0) AS `count(*)` from `分析1-未签到`;

-- ----------------------------
-- View structure for 人员id名单-2
-- ----------------------------
DROP VIEW IF EXISTS `人员id名单-2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `人员id名单-2` AS select `tbl_user_info`.`userID` AS `userID` from `tbl_user_info`;

-- ----------------------------
-- View structure for 公告板6
-- ----------------------------
DROP VIEW IF EXISTS `公告板6`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `公告板6` AS select `出勤列表`.`userName` AS `userName`,`出勤列表`.`signInTime` AS `signInTime` from `出勤列表` where (`出勤列表`.`出勤次数` = 1) limit 6;

-- ----------------------------
-- View structure for 出勤列表
-- ----------------------------
DROP VIEW IF EXISTS `出勤列表`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `出勤列表` AS select `出勤次数分析-3`.`userID` AS `userID`,`tbl_user_info`.`userName` AS `userName`,`tbl_user_info`.`WName` AS `WName`,`isWork`(`出勤次数分析-3`.`cnt`) AS `isSignIn`,sec_to_time(`1-上班时间`.`上班时间`) AS `signInTime`,`出勤次数分析-3`.`cnt` AS `出勤次数` from ((`出勤次数分析-3` join `tbl_user_info` on((`出勤次数分析-3`.`userID` = `tbl_user_info`.`userID`))) left join `1-上班时间` on((`出勤次数分析-3`.`userID` = `1-上班时间`.`userID`)));

-- ----------------------------
-- View structure for 出勤情况
-- ----------------------------
DROP VIEW IF EXISTS `出勤情况`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `出勤情况` AS select count(0) AS `总人数`,`3-迟到人数`.`count(*)` AS `n1`,`3-早退人数`.`count(*)` AS `n2`,((count(0) - `3-迟到人数`.`count(*)`) - `3-早退人数`.`count(*)`) AS `n3` from ((`tbl_user_info` join `3-迟到人数`) join `3-早退人数`);

-- ----------------------------
-- View structure for 出勤次数分析-3
-- ----------------------------
DROP VIEW IF EXISTS `出勤次数分析-3`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `出勤次数分析-3` AS select `人员id名单-2`.`userID` AS `userID`,count(`当日出勤情况-1`.`userID`) AS `cnt` from (`人员id名单-2` left join `当日出勤情况-1` on((`当日出勤情况-1`.`userID` = `人员id名单-2`.`userID`))) group by `人员id名单-2`.`userID` order by `人员id名单-2`.`userID`;

-- ----------------------------
-- View structure for 分析1-未签到
-- ----------------------------
DROP VIEW IF EXISTS `分析1-未签到`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `分析1-未签到` AS select `出勤次数分析-3`.`userID` AS `userID` from `出勤次数分析-3` where (`出勤次数分析-3`.`cnt` = 0);

-- ----------------------------
-- View structure for 分析2-在岗
-- ----------------------------
DROP VIEW IF EXISTS `分析2-在岗`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `分析2-在岗` AS select `出勤次数分析-3`.`userID` AS `userID` from `出勤次数分析-3` where (`出勤次数分析-3`.`cnt` = 1);

-- ----------------------------
-- View structure for 分析3-下班
-- ----------------------------
DROP VIEW IF EXISTS `分析3-下班`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `分析3-下班` AS select `出勤次数分析-3`.`userID` AS `userID` from `出勤次数分析-3` where (`出勤次数分析-3`.`cnt` = 2);

-- ----------------------------
-- View structure for 员工
-- ----------------------------
DROP VIEW IF EXISTS `员工`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `员工` AS select `tbl_user_info`.`userID` AS `userID`,`tbl_user_info`.`userName` AS `userName`,`tbl_user_info`.`userPwd` AS `userPwd`,`tbl_user_info`.`userSex` AS `userSex`,`tbl_user_info`.`userEmail` AS `userEmail`,`tbl_user_info`.`userBirthday` AS `userBirthday`,`tbl_user_info`.`depart` AS `depart`,`tbl_user_info`.`WID` AS `WID`,`tbl_user_info`.`WName` AS `WName`,ceiling(((to_days(now()) - to_days(`tbl_user_info`.`userBirthday`)) / 365)) AS `Age` from `tbl_user_info` where (`tbl_user_info`.`depart` = 0);

-- ----------------------------
-- View structure for 基准1-上下班时间
-- ----------------------------
DROP VIEW IF EXISTS `基准1-上下班时间`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `基准1-上下班时间` AS select `work_time`.`idx` AS `idx`,time_to_sec(`work_time`.`t1`) AS `t1`,time_to_sec(`work_time`.`t2`) AS `t2` from `work_time`;

-- ----------------------------
-- View structure for 奖惩
-- ----------------------------
DROP VIEW IF EXISTS `奖惩`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `奖惩` AS select `jc`.`idx` AS `idx`,`jc`.`userID` AS `userID`,`tbl_user_info`.`userName` AS `userName`,`tbl_user_info`.`WName` AS `WName`,`jc`.`jcTime` AS `jcTime`,`jc`.`jcMoney` AS `jcMoney`,`jc`.`jcDis` AS `jcDis` from (`jc` join `tbl_user_info` on((`jc`.`userID` = `tbl_user_info`.`userID`)));

-- ----------------------------
-- View structure for 已审批
-- ----------------------------
DROP VIEW IF EXISTS `已审批`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `已审批` AS select `rest`.`idx` AS `idx`,`rest`.`userID` AS `userID`,`tbl_user_info`.`userName` AS `userName`,`rest`.`t1` AS `t1`,`rest`.`t2` AS `t2`,`rest`.`dis` AS `dis`,`rest`.`agree` AS `agree`,`work`.`WName` AS `Wname` from ((`rest` join `tbl_user_info` on((`rest`.`userID` = `tbl_user_info`.`userID`))) join `work` on((`tbl_user_info`.`WID` = `work`.`WID`))) where (`rest`.`agree` <> 0);

-- ----------------------------
-- View structure for 当日出勤情况-1
-- ----------------------------
DROP VIEW IF EXISTS `当日出勤情况-1`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `当日出勤情况-1` AS select `sign`.`userID` AS `userID`,time_to_sec(`sign`.`t`) AS `TIME_TO_SEC(sign.t)` from `sign`;

-- ----------------------------
-- View structure for 打卡情况
-- ----------------------------
DROP VIEW IF EXISTS `打卡情况`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `打卡情况` AS select `num-未签到`.`count(*)` AS `n1`,`num-在岗`.`count(*)` AS `n2`,`num-下班`.`count(*)` AS `n3` from ((`num-在岗` join `num-下班`) join `num-未签到`);

-- ----------------------------
-- View structure for 未审批
-- ----------------------------
DROP VIEW IF EXISTS `未审批`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `未审批` AS select `rest`.`idx` AS `idx`,`rest`.`userID` AS `userID`,`tbl_user_info`.`userName` AS `userName`,`rest`.`t1` AS `t1`,`rest`.`t2` AS `t2`,`rest`.`dis` AS `dis`,`rest`.`agree` AS `agree`,`work`.`WName` AS `Wname` from ((`rest` join `tbl_user_info` on((`rest`.`userID` = `tbl_user_info`.`userID`))) join `work` on((`tbl_user_info`.`WID` = `work`.`WID`))) where (`rest`.`agree` = 0);

-- ----------------------------
-- View structure for 请假
-- ----------------------------
DROP VIEW IF EXISTS `请假`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `请假` AS select `rest`.`idx` AS `idx`,`rest`.`userID` AS `userID`,`tbl_user_info`.`userName` AS `userName`,`rest`.`t1` AS `t1`,`rest`.`t2` AS `t2`,`rest`.`dis` AS `dis`,`rest`.`agree` AS `agree`,`work`.`WName` AS `Wname` from ((`rest` join `tbl_user_info` on((`rest`.`userID` = `tbl_user_info`.`userID`))) join `work` on((`tbl_user_info`.`WID` = `work`.`WID`)));

-- ----------------------------
-- Function structure for findUser
-- ----------------------------
DROP FUNCTION IF EXISTS `findUser`;
delimiter ;;
CREATE FUNCTION `findUser`(`name` varchar(50))
 RETURNS int
  READS SQL DATA 
BEGIN

	set @idx=233;
	if (  
		(
			select count(*)
			from tbl_user_info
			where name=tbl_user_info.userName
		)=1
	) then
		set @idx=1;  # 存在这个用户
	else
		set @idx=0;  # 不存在这个用户
	end if;
	return @idx;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for isWork
-- ----------------------------
DROP FUNCTION IF EXISTS `isWork`;
delimiter ;;
CREATE FUNCTION `isWork`(`num` int)
 RETURNS int
  READS SQL DATA 
BEGIN

	# 判断是否已经签到，是则返回1，否则返回0

	if num=0 then
		return 0; 
	else 
		return 1;
	end if;
	
END
;;
delimiter ;

-- ----------------------------
-- Function structure for work1
-- ----------------------------
DROP FUNCTION IF EXISTS `work1`;
delimiter ;;
CREATE FUNCTION `work1`(`t` int)
 RETURNS int
  READS SQL DATA 
BEGIN


	# 判断是否迟到，迟到返回1，不迟到返回0
	
	if t>TIME_TO_SEC(`work_time`.t1) then
		return 1;  # 迟到啦哈哈
	else 
		return 0;
	end if;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table asrc
-- ----------------------------
DROP TRIGGER IF EXISTS `快速生成出勤数据`;
delimiter ;;
CREATE TRIGGER `快速生成出勤数据` BEFORE UPDATE ON `asrc` FOR EACH ROW begin


	# 清空出勤表，并载入测试数据
	
	if new.idx=1 then
		
		delete
		from sign;

		#	1~3 员工当前状态分析
		# 4~7 员工出勤分析
		
		
		
		
		
		# 1号，尚未签到
		
		# 2号，已签到
		insert into sign
		VALUES(2,'08:00:00');
	
		# 3号，已签退
		insert into sign
		VALUES(3,'08:00:00');
		insert into sign
		VALUES(3,'17:00:00');

			# 4~6	员工出勤分析
	

		# 4号，迟到
		insert into sign
		VALUES(4,'08:05:00');
		insert into sign
		VALUES(4,'17:00:00');
	
		# 5号，早退
		# insert into sign
		# VALUES(5,'08:00:00');
		# insert into sign
		# VALUES(5,'16:00:00');
	
	
		# 6号，迟到并且早退
		# insert into sign
		# VALUES(6,'08:05:00');
		# insert into sign
		# VALUES(6,'16:45:00');
	
	
		# 5~11号，正常上班		
		insert into sign
		VALUES(5,'08:00:00');
		
		insert into sign
		VALUES(6,'08:00:00');
	
		insert into sign
		VALUES(7,'08:00:00');
	
		insert into sign
		VALUES(8,'08:00:00');
	
		insert into sign
		VALUES(9,'08:00:00');
	
		insert into sign
		VALUES(10,'08:00:00');
	
		insert into sign
		VALUES(11,'08:00:00');
		
		
		
		
		
	end if;

end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_user_info
-- ----------------------------
DROP TRIGGER IF EXISTS `协同2`;
delimiter ;;
CREATE TRIGGER `协同2` BEFORE INSERT ON `tbl_user_info` FOR EACH ROW begin
	
	set new.WName=(
		select WName
		from work
		where new.WID=work.WID
	);
	
	
	


end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_user_info
-- ----------------------------
DROP TRIGGER IF EXISTS `协同`;
delimiter ;;
CREATE TRIGGER `协同` BEFORE UPDATE ON `tbl_user_info` FOR EACH ROW begin
	
	set new.WName=(
		select WName
		from work
		where new.WID=work.WID
	);


end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
