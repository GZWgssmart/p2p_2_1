/*
后台是用手机号密码登录，大家根据自己的功能登录相应的角色。密码：123456 （已加盐）
审核和设置奖励的组员，用13511111111登录
管理信息的组员，用13522222222登录

这五张表有数据的，全部删除数据之后再跑sql文件。

后台登录地址：/page/admin/login

*/

-- 默认三个用户的信息，root用户，manage用户，message用户
INSERT INTO `huser` VALUES ('1', 'root', '1', '13500000000', 'wr+H6GPsOw9hqVg1xXC1mQ==', 'root', '0', '默认分组', '123@qq.com', null, null, null, null);
INSERT INTO `huser` VALUES ('2', 'manage', '1', '13511111111', 'wr+H6GPsOw9hqVg1xXC1mQ==', 'manage', '1', '审核设置分组', '321@qq.com', null, null, null, null);
INSERT INTO `huser` VALUES ('3', 'message', '1', '13522222222', 'wr+H6GPsOw9hqVg1xXC1mQ==', 'message', '2', '信息设置分组', '222@qq.com', null, null, null, null);

-- 三个角色
INSERT INTO `role` VALUES ('1', 'root', '最高级用户');
INSERT INTO `role` VALUES ('2', 'manage', '审核和设置奖励用户');
INSERT INTO `role` VALUES ('3', 'message', '信息设置用户');

-- 有三个权限
INSERT INTO `jur` VALUES ('1', 'message', '管理信息的权限');
INSERT INTO `jur` VALUES ('2', 'manage', '审核和设置奖励的权限');
INSERT INTO `jur` VALUES ('3', 'root', 'root的权限');

-- 角色和用户关联关系
-- 1 root角色，1 root用户
INSERT INTO `roleuser` VALUES ('1', '1', '1');
-- 2 manage角色，2 manage用户
INSERT INTO `roleuser` VALUES ('2', '2', '2');
-- 3 message角色，3 message用户
INSERT INTO `roleuser` VALUES ('3', '3', '3');

-- 角色和权限关联
-- 1，root用户，1-3三个权限
INSERT INTO `rolejur` VALUES ('1', '1', '1');
INSERT INTO `rolejur` VALUES ('2', '1', '2');
INSERT INTO `rolejur` VALUES ('3', '1', '3');
-- 2 manage用户，2 审核和设置奖励权限
INSERT INTO `rolejur` VALUES ('4', '2', '2');
-- 3 message用户，3 管理信息的权限
INSERT INTO `rolejur` VALUES ('5', '3', '1');

-- 换用新的密码规则
UPDATE t_user set upwd = 'wr+H6GPsOw9hqVg1xXC1mQ==';