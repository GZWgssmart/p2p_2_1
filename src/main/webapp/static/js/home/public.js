// 格式化时间 年-月-日 时：分：秒
function formatDate(value) {
    if (value === undefined || value === null || value === '') {
        return "";
    } else {
        var date = new Date(value);
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();
        var hour = date.getHours().toString();
        var minutes = date.getMinutes().toString();
        var seconds = date.getSeconds().toString();
        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        if (hour < 10) {
            hour = "0" + hour;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
    }
}

// 格式化时间 年-月-日
function formatDateTime(value) {
    if (value === undefined || value === null || value === '') {
        return "";
    } else {
        var date = new Date(value);
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();
        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        return year + "-" + month + "-" + day;
    }
}

/**参数说明：
 * 根据长度截取先使用字符串，超长部分追加…
 * str 对象字符串
 * len 目标字节长度
 * 返回值： 处理结果字符串
 */
function cutString(str, len) {
    //length属性读出来的汉字长度为1
    if(str.length*2 <= len) {
        return str;
    }
    var strlen = 0;
    var s = "";
    for(var i = 0;i < str.length; i++) {
        s = s + str.charAt(i);
        if (str.charCodeAt(i) > 128) {
            strlen = strlen + 2;
            if(strlen >= len){
                return s.substring(0,s.length-1) + "...";
            }
        } else {
            strlen = strlen + 1;
            if(strlen >= len){
                return s.substring(0,s.length-2) + "...";
            }
        }
    }
    return s;
}
/**
 * 格式化借款类型
 * @param type
 * @returns {string}
 */
function formatType(type) {
    return type === 1 ? "个人" : "企业";
}

function formatRewardStatus(val) {
    return val === '1' ? "已发放" : "未发放";
}

/**
 * 格式化还款方式
 * @param way
 * @returns {*}
 */
function formatWay(way) {
    if(way === '1') {
        return "等额本息";
    } else if(way === '2') {
        return "等额本金";
    } else if(way === '3') {
        return "先息后本";
    } else if(way === '4') {
        return "一次还清";
    }
}
/**
 * 格式化借款状态
 * @param status
 * @returns {*}
 */
function formatStatus(status) {
    if(status === 0) {
        return "审核中";
    } else if(status === 1) {
        return "审核失败";
    } else if(status === 2) {
        return "借款中";
    } else if(status === 3) {
        return "已流标";
    } else if(status === 4) {
        return "还款中";
    } else if(status === 5) {
        return "已完成";
    } else if(status === 7) {
        return "审核通过";
    }
}
/**
 * 格式化还款状态
 * @param status
 * @returns {*}
 */
function formatHkStatus(status) {
    if(status === 0) {
        return "未还款";
    } else if(status === 1) {
        return "已还款";
    }
}